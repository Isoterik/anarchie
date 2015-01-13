/*
	File:
	Edit: preller @ freudenhaus <codepreller@hirnstrom.net>

	sends an updaterequest to the server. saving the factorio_inv
*/
private["_packet","_array"];
_packet = [getPlayerUID player,playerSide];

switch (playerSide) do {
	case civilian: {
		_packet set[count _packet,factorio_inv];
	};
};
diag_log format["client: updaterequest: %1",_packet];

[_packet,"FH_fnc_factorioUpdateRequest",false,false] spawn life_fnc_MP;