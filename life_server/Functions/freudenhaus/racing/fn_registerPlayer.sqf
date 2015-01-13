/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_registerPlayer.sqf
* adds the player to the competitor list
*
* Please feel free to use and modify it, but remember to credit the author.
* 
* PARAMS:
* _this select 0 - OBJECT - player who wants to register
*
*/

private ["_player"];

if (!isServer) exitWith {};

//parameter
_player = _this select 0;

//add player to the competitors
if (!(_player in race_competitors)) then {
	race_competitors = race_competitors + [_player];
	[[0,"Du bist nun angemeldet.",true],"life_fnc_broadcast",_player,false] spawn life_fnc_MP;
} else {
	[[0,"Du bist bereits angemeldet",true],"life_fnc_broadcast",_player,false] spawn life_fnc_MP;
};