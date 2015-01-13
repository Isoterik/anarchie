/*
	File: fn_alcoholCircle.sqf
	Author: Zero
	
	Description:
	Alcohol Handling.
*/


private ["_alc","_lastalc","_blur","_damage","_pos"];


_lastalc = 0;
life_alcohol = true;
life_alcdir = false;

sleep 5;

_alc = player getVariable["alcohol",0];
_pos = getposATL (vehicle player);

while {_alc > 0} do 
{

	_alc = player getVariable["alcohol",0];
	_alc = _alc * 100;
	_alc = floor(_alc);
	_alc = _alc / 100;
	_alc = _alc - 0.01;
	player setVariable["alcohol",_alc,true];

	_blur = _alc;
	"DynamicBlur" ppEffectEnable true;
	"DynamicBlur" ppEffectAdjust [_blur];
	_blur = _alc / 500;
	"RadialBlur" ppEffectEnable true; 
	"RadialBlur" ppEffectAdjust [_blur,0,0,0];  

	if(_lastalc < _alc)then
	{

		"DynamicBlur" ppEffectCommit 5;
		"RadialBlur" ppEffectCommit 5;
		sleep 5;
	}
	else
	{

		"DynamicBlur" ppEffectCommit 1;
		"RadialBlur" ppEffectCommit 1;
		sleep 1;
	};


	if(_alc > 0.4 && getposATL (vehicle player) distance _pos > 1 && !life_alcdir)then
	{
		life_alcdir = true;


		if((vehicle player) == player)then
		{
			[_alc] spawn {

				private ["_alc","_dir","_tick","_cdir"];
				_alc = _this select 0;
				_tick = floor(_alc * 30);
				_cdir = _alc / 12;


				if(random 10 < 5)then
				{
					for "_x" from 1 to _tick do
					{
						_dir = getdir (vehicle player);

						_dir = _dir + _cdir;
						(vehicle player) setdir _dir;
						sleep 0.001;

					};
				}else{
					for "_x" from 1 to _tick do
					{
						_dir = getdir (vehicle player);
						_dir = _dir - _cdir;
						(vehicle player) setdir _dir;
						sleep 0.001;
					};
				};
				life_alcdir = false;
			};
		};
	};

	_pos = getposATL (vehicle player);
	_lastalc = _alc;

	if(life_alctoxic && random 10 < 2)then
	{

		player setFatigue 1;
		_damage = damage player;
		_damage = _damage + random 0.02;
		player setDamage _damage;
		[] call life_fnc_hudUpdate;

	};

};


life_alcohol = false;
"DynamicBlur" ppEffectAdjust [0];
"DynamicBlur" ppEffectCommit 1;
"RadialBlur" ppEffectAdjust [0,0,0,0];
"RadialBlur" ppEffectCommit 1;
"DynamicBlur" ppEffectEnable false;
"RadialBlur" ppEffectEnable true;  



/*

	player setVariable["alcohol",-0.1,true]; 
	life_alctoxic = false; 
	player setVariable["alcohol",4,true]; 
	[] spawn alc_Circle;

*/