/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry","_players","_player","_playerName"];
disableSerialization;
_info = [_this,0,[],[[]]] call BIS_fnc_param;
_display = findDisplay 2400;
_list = _display displayctrl 2401;
_units = [];

//next line added by preller. 
_players = [];

{
	//next line edited by preller. filter civs and add the pid to the _units array instead of the player name
	if (side _x == civilian) then {
		_units set[count _units,getPlayerUID _x];
		_players set[count _players,_x];
	};

} foreach playableUnits;

{
	_entry = _x;
	_player = nil;
	//next line edited by preller: change _select 0 (name) to _select 1 (pid)
	if((_entry select 1) in _units) then
	{
		//next lines added by preller. search for the player object to display the players name
		{
			if (getPlayerUID _x == (_entry select 1)) exitWith {
				_player = _x;
			};
		} forEach playableUnits;

		//next line added by preller: error checking
		if (!(isNil "_player")) then {
			_list lbAdd format["%1",(name _player)];
			_list lbSetData [(lbSize _list)-1,str(_entry)];
		};
	};
} foreach _info;

ctrlSetText[2404,"Verbindung hergestellt"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "Keine Kriminelle";
};