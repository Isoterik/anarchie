/*
	File: fn_factorioSetupInv.sqf
	Author: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	sets actual value to the inv variables

*/

private ["_factorioInv"];
_factorioInv = [_this,0,[],[[]]] call BIS_fnc_param;

//initialize factorio inv
{
	missionNamespace setVariable[_x,0];

} forEach factorio_inv_items;

//setup variables
{
	diag_log format["setup: %1, %2",(_x select 0),(_x select 1)];
	_itemName = _x select 0;
	_itemAmount = _x select 1;
    [true,_itemName,_itemAmount] call FHC_fnc_factorioHandleInv;
} foreach (_factorioInv);