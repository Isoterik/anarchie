/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_registerToRace.sqf
* 
* register to the race.
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private [];
if (isServer) exitWith {};

if (!(player in race_competitors)) then {
	[[player],"FH_fnc_registerPlayer",false,false] spawn life_fnc_MP;
	hint "Du bist nun für das Rennen angemeldet."	
} else {

	hint "Du bist bereits für das nächste Rennen angemeldet.";
};
