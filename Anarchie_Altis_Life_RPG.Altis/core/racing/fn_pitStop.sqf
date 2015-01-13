/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_pitStop.sqf
* handles the freudenhaus race mechanics and repairs players vehicle if in range
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_vehicle","_nearEntities","_playerPos","_mechanicIsNear","_repair_time","_repair_finished_time","_repair_successfull","_seconds_to_go"];

if (isServer) exitWith {};

//define npc mechanics
_mechanics = [racing_mechanic1,racing_mechanic2,racing_mechanic3,racing_mechanic4,racing_mechanic5,racing_mechanic6];

_repair_time = 1; //in seconds

while {race_started} do {

	_vehicle = vehicle player;
	_mechanicIsNear = false;

	_playerPos = getPosATL player;

	//todo: improve by changing "Man" to a closer range of objects (only mechanics would be best)
    _nearEntities = _playerPos nearEntities ["Man",12];

	//check if a mechanic is in range
    {
    	if (_x in _nearEntities) then { 
    		_mechanicIsNear = true; 
    	};
   	} forEach _mechanics;

	//only repair if the player is the driver of the vehicle and a mechanic is near
	if ((player != _vehicle) && {player == driver _vehicle;} && {_mechanicIsNear;}) then {
		if (speed _vehicle > 1) then {
			hint "Stoppe dein Fahrzeug zum Reparieren";

		} else {
			_repair_finished_time = time + _repair_time;
			_seconds_to_go = _repair_time;
			hint format["Die Mechaniker reparieren dein Fahrzeug. Bleibe %1 Sekunden lang stehen!",_repair_time];

			_repair_successfull = true;

			//countdown
			while {_seconds_to_go != 0} do {
				if (round(_repair_finished_time - time) < _seconds_to_go) then {
					_seconds_to_go = _seconds_to_go - 1;
					hintSilent format["Wartung beendet in: %1",_seconds_to_go];
				};

				//interrupt repair if vehicle moves 
				if (speed _vehicle > 1 || speed _vehicle < -1) then {
					_repair_successfull = false;
					_seconds_to_go = 0;
					hint "Wartung abgebrochen. Dein Fahrzeug muss stehen!";
					sleep 1;
				};

				sleep 0.05;
			};

			//repair vehicle
			if (_repair_successfull) then {
				_vehicle allowDamage false;
				sleep 0.1;
				_vehicle setDamage 0;
				hint "Dein Fahrzeug ist repariert. GO GO GO!";
				_vehicle allowDamage true;
				sleep 10;				
			};
		};
	};

	sleep 1.0;

};