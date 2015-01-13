	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Edit: DJstone
	Copyright (C) 2013 Nicolas BOITEUX

	Real weather for MP GAMES v 1.2 
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	private [ "_mintime", "_maxtime", "_realtime", "_random", "_skiptime", "_startingdate", "_startingweather", "_timeforecast", "_timeratio","_timesync","_wcStartweather"];
	
	// Real time vs fast time
	// true: Real time is more realistic weather conditions change slowly (ideal for persistent game)
	// false: fast time give more different weather conditions (ideal for non persistent game) 
	_realtime = false;

	// Random time before new forecast
	// true: forecast happens bewteen mintime and maxtime
	// false: forecast happens at mintime
	_random = true;

	// Min time seconds (real time) before a new weather forecast
	_mintime = 1200;

	// Max time seconds (real time) before a new weather forecast
	_maxtime = 2700;

	// If Fastime is on
	// Ratio 1 real time second for x game time seconds
	// Default: 1 real second = 3.6 second in game
	_timeratio = 9;

	// send sync data across the network each xxx seconds
	// 60 seconds by default is a good value
	// shortest time do not improve weather sync
	_timesync = 300;

	// Mission starting date is 25/09/2013 at 12:00
	_startingdate = [2035, 07, 06, 08, 00];

	// Mission starting weather "CLEAR|CLOUDY|RAIN";
	_startingweather = "CLEAR";

	/////////////////////////////////////////////////////////////////
	// Do not edit below
	/////////////////////////////////////////////////////////////////
	
	if(_mintime > _maxtime) exitwith {hint format["Real weather: Max Zeit: %1 kann nicht größer als: %2 sein.", _maxtime, _mintime];};
	_timeforecast = _mintime;

	// we check the skiptime for 10 seconds
	_skiptime = _timeratio * 0.000278 * 10;

	setdate _startingdate;

	switch(toUpper(_startingweather)) do {
		case "CLEAR": {
			_wcStartweather = [0, 0, 0,[random 3, random 3, true], 0, date];
		};
		
		case "CLOUDY": {
			_wcStartweather = [0, 0, 0.6, [random 3, random 3, true], 0, date];
		};
		
		case "RAIN": {
			_wcStartweather = [1, 0, 1, [random 3, random 3, true], 0, date];
		};

		default {
			// clear
			_wcStartweather = [0, 0, 0, [random 3, random 3, true], 0, date];
			//diag_log "Real weather: Falsches Startwetter";
		};
	};
	
	// SERVER SIDE SCRIPT
	if (isServer) then
	{
		// Weather calculations thread.
		[_wcStartweather,_random,_mintime,_maxtime,_timesync] spawn
		{
			private ["_initial","_overcast","_lastovercast","_rain","_fog","_wind","_lastrain","_ligthning","_randomForeceast","_timeforecast","_mintime","_maxtime","_timesync"];
			
			//Initialisation
			_initial = true;
			_lastrain = 0;
			_lastovercast = 0;
			_rain = 0;
			_overcast = 0;
			_ligthning = 0;
			wcweather = _this select 0;
			_randomForeceast = _this select 1;
			_mintime = _this select 2;
			_maxtime = _this select 3;
			_timesync = _this select 4;

			while {true} do
			{
				if(_initial) then 
				{
					_initial = false;
	
					// apply  the Startingweather
					skipTime -24;
					86400 setRain (wcweather select 0);
					86400 setfog (wcweather select 1);
					86400 setOvercast (wcweather select 2);
					86400 setLightnings (wcweather select 4):
					skipTime 24;
					simulweatherSync;
					setwind (wcweather select 3);
					setdate (wcweather select 5);
					
					/*
					diag_log "-----------------";
					diag_log "WeatherThread started on ServerSide.";
					diag_log "-----------------";
					*/

					//Thread that syncs the client with the Server weather & time
					[_timesync] spawn 
					{
						private["_timesync"];
						_timesync = _this select 0;
			
						while { true } do 
						{
							wcweather set [5, date];
							publicvariable "wcweather";
							
							/*
							diag_log "-----------------";
							diag_log format["WeatherThread Weather Pushed by Server. Rain: %1, Fog: %2, Overcast: %3, Lightnings: %4, Wind: %5, Date: %6", wcweather select 0, wcweather select 1, wcweather select 2, wcweather select 4, wcweather select 3, wcweather select 5];
							diag_log "-----------------";
							*/
		
							sleep _timesync;
						};
					};		
				} else {
					//Overcast calculations
					if(_lastovercast <= 0.5)then
					{
						_overcast = [[[0.0,5],[0.2,3],[0.4,3],[0.6,3]]] call life_fnc_prioritySelect;
					} else {
						_overcast = [[[0.8,3],[1.0,3],[0.4,5],[0.6,3]]] call life_fnc_prioritySelect;
					};
					_lastovercast = _overcast;
					
					//Rain Calculations
					if(_lastovercast >= 0.60) then {
						if(_lastrain <= 0.5)then
						{
							_rain = [[[0.0,3],[0.2,3],[0.4,3],[0.6,4]]] call life_fnc_prioritySelect;
						} else {
							_rain = [[[0.8,3],[1.0,3],[0.4,3],[0.6,3]]] call life_fnc_prioritySelect;
						};
					} else {
						_rain = 0;
					};
					_lastrain = _rain;
				
					// Fog calculations
					if((date select 3 > 2) and (date select 3 <6)) then {
						_fog = 0.4 + (random 0.6);
					} else {
						if((_lastrain > 0.6) and (_rain < 0.2)) then {
							_fog = random 0.3;
						} else {
							_fog = 0;
						};
					};
				
					//Wind calculations
					if(random 1 > 0.95) then {
						_wind = [random 7, random 7, true];
					} else {
						_wind = [random 3, random 3, true];
					};
					
					//Ligthning calculations
					if(_rain > 0.88) then {
						_ligthning = random 1;
						if(_ligthning > 0.7)then
						{
							_ligthning = 1;
						};
					} else {
						_ligthning = 0;
					};
			
					//Setting weatherConfiguration, the Zero is for always no fog.
					wcweather = [_rain, 0, _overcast, _wind, _ligthning, date];
					300 setRain (wcweather select 0);
					300 setfog (wcweather select 1);
					300 setOvercast (wcweather select 2);
					300 setLightnings (wcweather select 4);
					setwind (wcweather select 3);
				};
				if(_randomForeceast) then 
				{
					_timeforecast = _mintime + (random (_maxtime - _mintime));
				};
				sleep _timeforecast;
			};
		};
		
	// CLIENT SIDE SCRIPT
	} else {
	
		//Initialisation of the EventHandler that executes when the wcweather is updated by the server.
		"wcweather" addPublicVariableEventHandler 
		{
			300 setRain (wcweather select 0);
			300 setfog (wcweather select 1);
			300 setOvercast (wcweather select 2);
			300 setLightnings (wcweather select 4);
			setwind (wcweather select 3);
			setdate (wcweather select 5);
		};

		// accelerate time 
		if!(_realtime) then 
		{
			[_skiptime] spawn 
			{
				private["_skiptime"];
				_skiptime = _this select 0;

				while {true} do 
				{
					skiptime _skiptime;
					sleep 10;
				};
			};
		};
		
		skipTime -24;
		86400 setRain (wcweather select 0);
		86400 setfog (wcweather select 1);
		86400 setOvercast (wcweather select 2);
		86400 setLightnings (wcweather select 4);
		skipTime 24;
		simulweatherSync;
		setwind (wcweather select 3);
		setdate (wcweather select 5);

		/*
		diag_log "-----------------";
		diag_log format["WeatherThread Weather Started by Client. Rain: %1, Fog: %2, Overcast: %3, Lightnings: %4, Wind: %5, Date: %6", wcweather select 0, wcweather select 1, wcweather select 2, wcweather select 4, wcweather select 3, wcweather select 5];
		diag_log "-----------------";
		*/
	};