/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount","_speedingPoints"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 11; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, blacklist, speeding_points FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case east: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, adac_licenses, adaclevel, adac_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_tmp = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};
_queryResult set[6,_tmp];

//Convert tinyint to boolean
_tmp = _queryResult select 6;
for "_i" from 0 to (count _tmp)-1 do
{
	_data = _tmp select _i;
	_tmp set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};
_queryResult set[6,_tmp];

//Get Blacklistentry
_tmp = _queryResult select 9;
_queryResult set[9,([_tmp,1] call DB_fnc_bool)];

//Parse data for specific side.
switch (_side) do {
	case west: {
		_tmp = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};
		_queryResult set[8,_tmp];
	};
	
	case civilian: {
		_tmp = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};
		_queryResult set[8,_tmp];
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		//SpeedingPoints
		_tmp = _queryResult select 10;
		_queryResult set[10,[_tmp] call DB_fnc_numberSafe];
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult set[count _queryResult,(missionNamespace getVariable[format["houses_%1",_uid],[]])];
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult set[count _queryResult,(missionNamespace getVariable[format["gang_%1",_uid],[]])];
		missionNamespace setVariable[format["gang_%1",_uid],nil];
	};

	case independent: {
		_tmp = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};
		_queryResult set[8,_tmp];
	};

	case east: {
		_tmp = [(_queryResult select 8)] call DB_fnc_mresToArray;
		if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};
		_queryResult set[8,_tmp];
	};
};

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;