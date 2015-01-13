/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_name","_queryResult","_factorio_inv","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_factorio_inv = [_this,2,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if(_uid == "") exitWith {};

//Parse and setup some data.
_factorio_inv = [_factorio_inv] call DB_fnc_mresArray;
diag_log format["server updaterequest: %1",_factorio_inv];
diag_log format["server updaterequest: %1",_side];

switch (_side) do {
	case civilian: {_query = format["UPDATE players SET factorio='%2' WHERE playerid='%1'",_uid,_factorio_inv];};
};

diag_log format["server updaterequest: %1",_query];

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;