/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_handleRounds.sqf
* handles the race round counter and calculates racers round time
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_playerPos","_nearObjects","_round_time","_minutes","_seconds"];
if (isServer) exitWith {};

while {race_started} do {
	_playerPos = getPosATL player;

	//todo: improve by changing "All" to a closer range of objects (only gatethings would be best)
	_nearObjects = _playerPos nearObjects ["All",5];

	if ((finish_line in _nearObjects) && vehicle player != player) then {
		racing_rounds = racing_rounds + 1;

		//calculate roundtime
		_round_time = time - round_starttime;
		_minutes = floor (_round_time / 60);
		_seconds = _round_time % 60;

		titleText [format["Du hast die %1. Runde beendet. Rundenzeit: %2m:%3s",racing_rounds,_minutes,_seconds], "PLAIN"];

		//send round information to the server
		[[player,racing_rounds,_round_time],"FH_fnc_handleRace",false,false] spawn life_fnc_MP;

		//new round
		round_starttime = time;
		sleep 20.0;
	};

	sleep 0.1;

};