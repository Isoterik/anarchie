/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* manageSpeedingPoints.sqf
* observes the players speeding points and handles the punishment and warnings
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

if (isServer) exitWith {};
diag_log speeding_points;

_POINTS_WARNING = 5; //the player will get informed about the consequences
_POINTS_PUNISHED = 10; //player get punished

if (speeding_points >= 0 && speeding_points < _POINTS_WARNING) then {
	hint format["Fahr vorsichtiger! Du hast bereits %1 Strafpunkte erhalten.",speeding_points];
};

if (speeding_points >= _POINTS_WARNING && speeding_points < _POINTS_PUNISHED) then {
	hint format["Du hast jetzt %1 Strafpunkte. Noch %2 Punkte und deine Führerscheine werden eingezogen. Zudem wirst du eine !empfindliche! Strafe zahlen muessen.",speeding_points,(_POINTS_PUNISHED - speeding_points)];
};

if (speeding_points >= _POINTS_PUNISHED) then {
	//remove licenses
	license_civ_driver = false;
	license_civ_truck = false;

	//wanted add
	[[getPlayerUID player,profileName,"907"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

	hint format["Deine Führerscheine wurden eingezogen. Du stehst zudem auf der Fahndungsliste. Melde dich bei beim AMOK-Sicherheitsdienst und zahle deine Strafe."];

	//reset speeding_points;
	speeding_points = 0;
};