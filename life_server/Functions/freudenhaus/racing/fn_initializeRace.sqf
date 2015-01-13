/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_raceManager.sqf
* initializes the race
*
* Please feel free to use and modify it, but remember to credit the author.
*
* _this select 0 - integer - rounds to be driven
*
*/

private ["_names","_race_max_rounds"];

if (!isServer) exitWith {};

//param
_race_max_rounds = [_this,0,-1,[0]] call BIS_fnc_param;	

if (_race_max_rounds != -1) then {
	race_max_rounds = _race_max_rounds;
};

//initialize server variable
race_round_ranking = [];
race_isWinninground = false;
race_fastest_round = [99999999,racing_manager];

//initialize round ranking table
for [{_x=0},{_x<race_max_rounds},{_x=_x+1}] do {
	race_round_ranking = race_round_ranking + [[]];
};

//Broadcast on the server
[[0,format["Hiho liebe Bürger von Altis. Das Rennen startet in wenigen Minuten. Wer noch keinen Platz hat, sollte sich einen suchen."],true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

//broadcast competitor names
sleep 5;
_names = "Folgende Fahrer werden am nächsten Rennen teilnehmen: | ";

//get player profil names for broadcasting
{
	_names = _names + (name _x);
	_names = _names + " | ";
} forEach race_competitors;

[[0,_names,true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

//player should prepare for the race
{
	[[],"life_fnc_prepareRace",_x,false] spawn life_fnc_MP;
} forEach race_competitors;

sleep 10;

//another broadcast. 
[[0,format["Das Rennen startet in 2 Minuten."],true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep 110;

[[0,format["10 Sekunden und das Rennen startet!"],true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

sleep 7;

//start the race
{
	[[],"life_fnc_startRace",_x,false] spawn life_fnc_MP;
} forEach race_competitors;