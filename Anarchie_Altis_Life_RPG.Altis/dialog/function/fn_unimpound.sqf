#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Die Auswahl war fehlerhaft..."};

//Neu : Preiseinteilung in Fraktionen.
switch (side player) do
{
	case civilian:
	{
		_price = [_vehicle,__GETC__(life_garage_prices_civ)] call fnc_index;
		if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices_civ) select _price) select 1;};
	};
	
	case west:
	{
		_price = [_vehicle,__GETC__(life_garage_prices_cop)] call fnc_index;
		if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices_cop) select _price) select 1;};
	};
	
	case independent:
	{
		_price = [_vehicle,__GETC__(life_garage_prices_med)] call fnc_index;
		if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices_med) select _price) select 1;};
	};
	
	case east:
	{
		_price = [_vehicle,__GETC__(life_garage_prices_adac)] call fnc_index;
		if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices_adac) select _price) select 1;};
	};
};
if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(typeName life_garage_sp == "ARRAY") then {
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
	[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
};
};

hint localize "STR_Garage_SpawningVeh";

life_atmcash = life_atmcash - _price;