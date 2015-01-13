/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_registerPlayer.sqf
* gets rounds from the player and handles winning condition
*
* Please feel free to use and modify it, but remember to credit the author.
* 
* PARAMS:
* _this select 0 - OBJECT - player
* _this select 1 - Integer - rounds player has driven
* _this select 2 - double or so - player roundtime in seconds (time)
*
*/

private ["_player","_round","_round_time","_round_ranking","_fastest_round_time"];

if (!isServer) exitWith {};

//PARAMS
_player = _this select 0;
diag_log _player;
_round = _this select 1;
_round_time = _this select 2;

//adding player to the round ranking multi array
_round_ranking = race_round_ranking select (_round - 1);
_round_ranking set [count _round_ranking,_player];
race_round_ranking set [(_round-1),_round_ranking];

//set fastest round time and player
_fastest_round_time = race_fastest_round select 0;
if (_round_time < _fastest_round_time) then {
	race_fastest_round = [_round_time,_player];
};

//execute only on the winning round (WINNER!)
if ((!race_isWinninground) && {_round == race_max_rounds}) then {
	race_isWinninground = true;
	[[0,format["Wir haben einen Gewinner! Diese Runde geht an %1! ",name _player],true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	[_player] spawn FH_fnc_stopRace;
};

if (_round == race_max_rounds) then {
	[[],"life_fnc_endRace",_player,false] spawn life_fnc_MP;	
};