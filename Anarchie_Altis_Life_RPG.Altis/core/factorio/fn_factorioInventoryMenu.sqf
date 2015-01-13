/*
	File: fn_factorioInventoryMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	factorio inventory menu
*/
private["_tInv","_pInv"];
disableSerialization;

_tInv = (findDisplay 3500) displayCtrl 3502;
_pInv = (findDisplay 3500) displayCtrl 3503;
lbClear _tInv;
lbClear _pInv;

//Player Inventory Items
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_pInv lbAdd format["[%1] - %2",_val,_str];
		_pInv lbSetData [(lbSize _pInv)-1,_shrt];
	};

} foreach life_inv_items;

//Factorio Inventory Items
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_tInv lbAdd format["[%1] - %2",_val,_str];
		_tInv lbSetData [(lbSize _tInv)-1,_shrt];
	};

} foreach factorio_inv_items;
