/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_initializeRace.sqf
* action: start the race
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_rounds","_adminLevel"];
if (isServer) exitWith {};
_rounds = [_this,5,-1,[0]] call BIS_fnc_param;
_adminLevel = call life_adminlevel;

hint "Du hast die Rennvorbereitungen gestartet";
[[_rounds],"FH_fnc_initializeRace",false,false] spawn life_fnc_MP;

/*
if (_adminLevel > 0) then {
	hint "Du hast die Rennvorbereitungen gestartet";
	[[_rounds],"FH_fnc_initializeRace",false,false] spawn life_fnc_MP;
} else {
	hint "Aktuell kann das Rennen nur von einem Admin gestartet werden. Solltest du ein Rennen organisieren wollen, wende dich an einen Admin.";
};
*/