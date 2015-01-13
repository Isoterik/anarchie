/*
	Author: Alex "DJstone" 
	
	Description:
	Manages the blacklist value from a playerID.
*/

private["_uid","_block","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_block = [_this,1,false,[false]] call BIS_fnc_param;

if(_uid == "") exitWith {};

if(_block)then
{
	_query = format["UPDATE players SET blacklist='1' WHERE playerid='%1'",_uid];
}else{
	_query = format["UPDATE players SET blacklist='0' WHERE playerid='%1'",_uid];
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,0] call DB_fnc_asyncCall;

