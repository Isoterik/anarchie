/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_startRace.sqf
* starts the race
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_vehicle"];
if (isServer) exitWith {};
titleText ["Das Rennen startet in 3 Sekunden!", "PLAIN"];

sleep 1;

titleText ["2 Sekunden", "PLAIN"];

sleep 1;

titleText ["1 Sekunde", "PLAIN"];

sleep 1;

_vehicle = vehicle player;

//initialize variables
race_started = true;
racing_rounds = 0;
round_starttime = time;

//false start
if (speed _vehicle > 0) then {
	titleText ["Fehlstart. Eine Strafsekunde! Warte bis zum Start!", "PLAIN"];
	sleep 1;
};

titleText ["GO! GO! GO!", "PLAIN"];

//spawn utility scripts
[] spawn life_fnc_pitStop;
[] spawn life_fnc_handleRounds;