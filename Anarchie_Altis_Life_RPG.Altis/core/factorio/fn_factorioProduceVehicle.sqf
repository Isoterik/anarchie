/*
	File: fn_factorioProduceVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: preller @freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	lets produce a vehicle

	PARAMS:
	_this select 0 - STRING - class typeName
	_this select 1 - INTEGER - color index
*/
private["_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];

_className = [_this,0,"",[""]] call BIS_fnc_param;
_colorIndex = [_this,1,-1,[0]] call BIS_fnc_param;

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

//Check if there is multiple spawn points and find a suitable spawnpoint.
if(typeName _spawnPoints == typeName []) then {
	//Find an available spawn point.
	{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
} else {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
};

if(_spawnPoint == "") exitWith {
	hint "Ein Fahrzeug blockiert den Spwanpunkt!";
	false;
};

//Spawn the vehicle and prep it.
_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Wait?
_vehicle allowDamage false; //Temp disable damage handling..
_vehicle lock 2;
_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos (getMarkerPos _spawnPoint);
[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
_vehicle allowDamage true; //Re-enable damage handling.
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle setVariable["trunk_in_use",false,true];
_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.


//Disable TankTruck and AmmoTruck Functions.
[_vehicle,"any_tankTruck",true] spawn life_fnc_vehicleAnimate;

life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.

if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
	[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
};

[] call FHC_fnc_factorioUpdateRequest; //Sync silently because it's obviously silently..
closeDialog 0; //Exit the menu.
true;