/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_wantedListQuery.sqf
* get all data from the wantedlist
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_uid","_query","_queryResult","_name","_uid","_crimes","_bounty"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;

_query = format["SELECT name, userid, crimes, bounty FROM wantedlist"];

diag_log format["!!!!!!!!!!! WANTEDLIST !!!!!!!!!!!"];
diag_log format["QUERY: %1",_query];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

diag_log _queryResult;

if(!isNil {(_queryResult select 0)}) then
{
	{
		_name = (_x select 0);
		_uid = (_x select 1);
		_crimes = (_x select 2);
		_bounty = (_x select 3);
		life_wanted_list set[count life_wanted_list,[_name, _uid, _crimes, _bounty]];
	} foreach _queryResult;
};