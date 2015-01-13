/*
	File: fn_dataQuery.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: preller @freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	Starts the 'authentication' process and sends a request out to
	the server to check for player information.
*/
private["_uid","_side","_sender"];
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;

[[_uid,_side,_sender],"FH_fnc_factorioQueryRequest",false,false] call life_fnc_MP;