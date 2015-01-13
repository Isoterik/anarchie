/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_wantedListDelete.sqf
* deletes a user from the wantedlist
*
* Please feel free to use and modify it, but remember to credit the author.
*
* _this select 0 - STRING: id - user id 
*
*/

private ["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;

_query = format["DELETE FROM wantedlist WHERE userid = '%1'",_uid];

diag_log format["!!!!!!!!!!! WANTEDLIST !!!!!!!!!!!"];
diag_log format["DELETE: %1",_query];

waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;