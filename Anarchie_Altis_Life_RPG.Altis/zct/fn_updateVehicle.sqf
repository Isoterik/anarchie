/*
	File: fn_insertVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Inserts the vehicle into the database
*/
private ["_uid","_color","_plate","_query","_sql","_change","_veh","_curuid","_newuid","_dbInfo","_tickTime"];
_change = [_this,0,"",[""]] call BIS_fnc_param;
_veh = [_this,1,"",[""]] call BIS_fnc_param;
_curuid = [_this,2,"",[""]] call BIS_fnc_param;
_newuid =[_this,3,"",[""]] call BIS_fnc_param;
_color = [_this,4,-1,[0]] call BIS_fnc_param;


//Stop bad data being passed.
if(_change == "" || _curuid == "" || _veh == "") exitWith {};

_dbInfo = _veh getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;

if(_uid != _curuid) exitWith {};

// (side, classname, type, pid, alive, active, inventory, color, plate)

if(_change == "color")then
{
	if(_color == -1)exitWith {};
	_query = format["UPDATE vehicles SET color='%1' WHERE pid='%2' AND plate='%3'",_color,_uid,_plate];
};

if(_change == "owner")then
{
	if(_newuid == "")exitWith {};
	_query = format["UPDATE vehicles SET pid='%1' WHERE pid='%2' AND plate='%3'",_newuid,_uid,_plate];
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,1] call DB_fnc_asyncCall;

diag_log "------------- Tuning Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";


