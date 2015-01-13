/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: preller @ freudenhaus <codepreller@hirnstrom.net>
	
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
	case civilian: {_returnCount = 11; format["SELECT factorio FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Factorio Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {
	
};

if(count _queryResult == 0) exitWith {
	
};

//Blah conversion thing from a2net->extdb
private["_tmp","_result"];
_result = [];
_tmp = [(_queryResult select 0)] call DB_fnc_mresToArray;
if(typeName _tmp == "STRING") then {_tmp = call compile format["%1", _tmp];};

diag_log _tmp;
_result set [0,_tmp];

diag_log _result;
[_result,"FHC_fnc_factorioRequestReceived",_ownerID,false] spawn life_fnc_MP;