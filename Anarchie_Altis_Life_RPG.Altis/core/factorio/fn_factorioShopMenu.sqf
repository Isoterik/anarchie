/*
	File: fn_factorioShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: preller @ freudenhaus <codepreller@hirnstrom.net>

	Description:
	display producable items
*/
private["_spawnPoints","_itemList"];

//this addAction[""Factorio"",life_fnc_factorioShopMenu,[""example_spawn_point""]];";

//parameter
_spawnPoints = [(_this select 3),0,"",["",[]]] call BIS_fnc_param;

disableSerialization;

//Long boring series of checks
if(dialog) exitWith {};

//open dialog
if(!createDialog "FactorioItemDialog") exitWith {};

//life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy];
life_veh_shop = ["",_spawnPoints,"",true];

//ctrlSetText [2301,((_this select 3) select 4)];

//Fetch the shop config.
//_itemList = [_shop] call FHC_fnc_factorioCfg;
_itemList = ["vehicles"] call FHC_fnc_factorioCfg;

_control = ((findDisplay 2300) displayCtrl 2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
	_itemClassName = _x select 0;
	
	_vehicleInfo = [_itemClassName] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
	_control lbSetData [(lbSize _control)-1,_itemClassName];
	_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
} foreach _itemList;