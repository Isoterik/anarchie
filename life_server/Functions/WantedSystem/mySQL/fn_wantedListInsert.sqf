/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_wantedListInsert.sqf
* insert an wantedlist entry for a player
*
* Please feel free to use and modify it, but remember to credit the author.
*
* _this select 0 - STRING: name - player name
* _this select 1 - STRING: id - user id 
* _this select 2 - ARRAY: crimes - crimes
* _this select 3 - Integer: bounty - the bounty for the crime
*
*/

private ["_name","_uid","_crimes","_bounty"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_crimes = [_this,2,[],[[]]] call BIS_fnc_param;
_bounty = [_this,3,0,[0]] call BIS_fnc_param;

diag_log format["insert crimes: %1",_crimes];

_query = format["INSERT INTO wantedlist (name, userid, crimes, bounty) VALUES ('%1','%2','%3','%4');",_name,_uid,_crimes,_bounty];

diag_log format["!!!!!!!!!!! WANTEDLIST !!!!!!!!!!!"];
diag_log format["QUERY: %1",_query];

waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;