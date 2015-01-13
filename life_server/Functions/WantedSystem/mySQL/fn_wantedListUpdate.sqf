/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_wantedListUpdate.sqf
* update a wantedlist entry
*
* Please feel free to use and modify it, but remember to credit the author.
*
* _this select 1 - STRING: id - user id 
* _this select 2 - ARRAY: crimes - crimes
* _this select 3 - Integer: bounty - the bounty for the crime
*
*/

private ["_uid","_crimes","_bounty"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_crimes = [_this,1,[],[[]]] call BIS_fnc_param;
_bounty = [_this,2,0,[0]] call BIS_fnc_param;

_query = format["UPDATE wantedList SET crimes = '%2', bounty = '%3' WHERE userid = '%1'",_uid,_crimes,_bounty];

diag_log format["!!!!!!!!!!! WANTEDLIST !!!!!!!!!!!"];
diag_log format["UPDATE: %1",_query];

waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;