#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	author: preller @ freudenhaus <codepreller@hirnstrom.net>
	some of the code is taken from tonics vehstoreitem.sqf

	put items from the factorio inv to the player inv
*/

private ["_item","_itemNumber","_virtItem"];
disableSerialization;

_item = ctrlSelData(3502);
_itemNumber = ctrlText 3505;

_virtItem = [_item,0] call FHC_fnc_factorioHandleVar;
if (_virtItem == "") exitWith {hint "Du kannst nur die zur Herstellung benoetigten Gueter einlagern!"};

//error check taken from tonic
if(!([_itemNumber] call fnc_isnumber)) exitWith {hint "Gib ne richtige Zahl an. So 1 oder 5 oder so...";};
_itemNumber = parseNumber(_itemNumber);
if(_itemNumber < 1) exitWith {hint "Du kannst keine Zahl die kleiner ist als 1 eingeben!";};

_itemNumber = [_virtItem,_itemNumber,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_itemNumber == 0) exitWith {hint "Dein Inventar ist voll"};	

//delete items from the factorio inv
if(!([false,_item,_itemNumber] call FHC_fnc_factorioHandleInv)) exitWith {hint "Du hast nicht so viele Items";};

//add item to the player inv
if(!([true,_virtItem,_itemNumber] call life_fnc_handleInv)) exitWith {
	[false,_item,_itemNumber] call FHC_fnc_factorioHandleInv;
	hint "Das hinzufuegen hat nicht funktioniert. Alles wurde zurueckgesetzt.";
};

[] call FHC_fnc_factorioUpdateRequest; 

//update gui
call FHC_fnc_factorioInventoryMenu;