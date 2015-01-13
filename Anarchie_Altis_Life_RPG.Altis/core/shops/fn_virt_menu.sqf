/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;

if(vehicle player != player)exitwith{hint "Du musst zum Verkaufen aussteigen!";};
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint "Du bist kein Polizist."};
if(_shop == "adac" && playerSide != east) exitWith {hint "Du gehoerst nicht zum ATAC."};
if(_shop == "arzt" && playerSide != independent) exitWith {hint "Du bist kein Arzt."};
createDialog "shops_menu";

[] call life_fnc_virt_update;