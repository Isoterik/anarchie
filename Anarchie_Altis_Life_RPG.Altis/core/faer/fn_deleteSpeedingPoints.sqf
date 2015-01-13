/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* deleteSpeedingPoints.sqf
* deletes all speeding points from the player
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_points"];

if (isServer) exitWith {};

//delete all speeding points
speeding_points = 0;