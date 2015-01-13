/*
	File: fn_factorioRequestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/

diag_log format["client requestreceived: %1",_this select 0];

//Parse side specific information.
switch(playerSide) do {
	case civilian: {
		factorio_inv = _this select 0;
		[factorio_inv] spawn FHC_fnc_factorioSetupInv;
	};
};