/*
	File: fn_lockSounds.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle", "_state"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_state = [_this,1,2,[0,false]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if (_state == 2) then {
	_vehicle say3D "LockSound";
}else{
	_vehicle say3D "UnlockSound";
};
sleep 1.5;
life_lockingCar = false;


