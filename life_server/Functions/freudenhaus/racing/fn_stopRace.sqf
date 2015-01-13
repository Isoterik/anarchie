/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_stopRace.sqf
* initializes the end of the race
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0 - OBJECT - winner of the race
*
*/

private ["_winner","_statistics"];
_winner = _this select 0;

if (!isServer) exitWith {};

{
	if (!(_x == _winner)) then {
		[[1,format["Der Sieger ist bestimmt. Das Rennen wir in 2 Minuten beendet"],true],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;	
	};
} forEach race_competitors;

sleep 120;

_statistics = "Das Rennen ist beendet. Ergebnisse: ";
for [{_x=0},{_x<(count (race_round_ranking select (race_max_rounds - 1)))},{_x=_x+1}] do {
	_statistics = _statistics + format["%1. %2 ",(_x+1), name ((race_round_ranking select (race_max_rounds - 1)) select _x)];
};

_statistics = _statistics + format["| %1 Fahrer sind nicht angekommen.",(count race_competitors - (count (race_round_ranking select (race_max_rounds - 1))))];
[[0,_statistics,true],"life_fnc_broadcast",true,false] spawn life_fnc_MP;

{
	[[1,format["Das Rennen ist beendet. Sollte noch eines stattfinden melde dich bitte erneut an."],true],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;	
	[[2,format["Schnellste Runde: %1 Sekunden von %2! ",race_fastest_round select 0, name (race_fastest_round select 1)],true],"life_fnc_broadcast",_x,false] spawn life_fnc_MP;

	[[],"life_fnc_endRace",_x,false] spawn life_fnc_MP;	
} forEach race_competitors;

race_competitors = [];