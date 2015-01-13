#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	author: preller @ freudenhaus <codepreller@hirnstrom.net>
	some of the code is taken from tonics vehstoreitem.sqf

	put items from the player inv to the factorio inv
*/
private ["_item","_itemNumber","_factorioItem"];
disableSerialization;

_item = ctrlSelData(3503);
_itemNumber = ctrlText 3506;

_factorioItem = [_item,1] call FHC_fnc_factorioHandleVar;
if (_factorioItem == "") exitWith {hint "Du kannst nur die zur Herstellung benoetigten Gueter einlagern!"};

//error check taken from tonic
if(!([_itemNumber] call fnc_isnumber)) exitWith {hint "Gib ne richtige Zahl an. So 1 oder 5 oder so...";};
_itemNumber = parseNumber(_itemNumber);
if(_itemNumber < 1) exitWith {hint "Du kannst keine Zahl die kleiner ist als 1 eingeben!";};

//delete items from the player inv
if(!([false,_item,_itemNumber] call life_fnc_handleInv)) exitWith {hint "Du hast nicht so viele Gegenstaende";};

//add item to the factorio inv
if(!([true,_factorioItem,_itemNumber] call FHC_fnc_factorioHandleInv)) exitWith {
	[false,_item,_itemNumber] call life_fnc_handleInv;
	hint "Das Hinzufuegen hat nicht geklappt. Alles wurde zurueckgesetzt.";
};

[] call FHC_fnc_factorioUpdateRequest; 

//update gui
call FHC_fnc_factorioInventoryMenu;