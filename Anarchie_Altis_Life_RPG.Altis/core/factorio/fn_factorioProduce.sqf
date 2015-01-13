/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_factorioProduce.sqf
* 
* handles the production process
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

private ["_inputItems", "_inputItemsNeeded", "_itemsInv", "_itemsNeeded", "_inputItemsDeleted", "_ui", "_progress", "_pgText", "_cP", "_processor","_formatedProcessingInfo","_processingCost","_carType","_productionInfo","_processingSpeed","_colorIndex"];

if (isServer) exitWith {};

//Error check. taken from tonic.
if(vehicle player != player) exitwith {hint format["Du darfst nicht im Fahrzeug sitzen"];};

//initialize
_inputItemsDeleted = true;
_hasItems = true;

//set processing speed
_processingSpeed = 0.2; //second per procent example: speed = 1 means 100sec

if (life_is_processing) exitWith {hint "Der Kollege ist beschäftigt. Bitte nicht stressen!";};	

life_is_processing = true;

if((lbCurSel 2302) == -1) exitWith {hint "Du hast keinen Gegenstand ausgewaehlt!"};
_className = lbData[2302,(lbCurSel 2302)];
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//define your production line here
_productionInfo = switch (_className) do
{
	//Cars
	//case "B_Truck_01_box_F": {[["ftyre","fbody"],[1,100],5000];};
	case "I_Heli_Transport_02_F": {[["ftyre","fbody","fseats","fcable","fglass","foilp"],[6,400,400,420,200,150],5000];};
	case "I_MRAP_03_F": {[["ftyre","fbody","fseats","fcable","fglass","foilp"],[4,500,600,450,300,200],5000];};
	case "B_Truck_01_box_F": {[["ftyre","fbody","fseats","fcable","fglass","foilp"],[8,650,600,480,150,180],5000];};
	case "B_Truck_01_fuel_F": {[["ftyre","fbody","fseats","fcable","fglass","foilp"],[8,700,700,500,180,400],5000];};
	case "O_Truck_03_device_F": {[["ftyre","fbody","fseats","fcable","fglass","foilp"],[6,350,360,220,100,100],5000];};
	default {[]};
};

diag_log format["TEST: %1 + %2",_productionInfo,_className];

//initialize production infos
_inputItems = _productionInfo select 0;
_inputItemsNeeded = _productionInfo select 1;
_processingCost = _productionInfo select 2;

if ((count _inputItems) != (count _inputItemsNeeded)) exitWith 
	{diag_log format["ERROR: ProcessMultipleItems falsch initialisiert: Anzahl InputItems ungleich Anzahl InputItem Kosten"];};

//check if the player has enough items
for "_x" from 0 to ((count _inputItems) - 1) do {
	//get current amount player has
	_itemsInv = missionNamespace getVariable ([(_inputItems select _x),0] call life_fnc_varHandle);
	_itemsNeeded = _inputItemsNeeded select _x;

	diag_log format["produceCar: iteminv: %1",_itemsInv];

	if (_itemsInv < _itemsNeeded) then {
		_hasItems = false;
	};
};

//exit if the player doenst have the required items for one process
if (!_hasItems) exitWith {
	hint "Du hast nicht genug Materialien dabei";
	life_is_processing = false;
};

//exit if the player doenst have the required money for one process
if (life_cash < _processingCost) exitWith {
	hint "Du hast nicht genug Geld dabei";
	life_is_processing = false;
};

//Setup our progress bar. taken from tonic.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Bei der Herstellung."];
_progress progressSetPosition 0.01;
_cP = 0.01;	

//progress bar. taken from tonic.
while{true} do
{
	sleep _processingSpeed;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Bei der Herstellung."];
	if(_cP >= 1) exitWith {};
};

5 cutText ["","PLAIN"];
titleText["Test","PLAIN"];

_isProduced = [_className,_colorIndex] call FHC_fnc_factorioProduceVehicle;

if (_isProduced) then {
	//substract items 
	for "_x" from 0 to ((count _inputItems) - 1) do {
		//reduce 
		if (!([false,(_inputItems select _x),(_inputItemsNeeded select _x)] call life_fnc_handleInv)) then {
			_inputItemsDeleted = false;
		}
	};

	//save to the db, no relogging/cheating at this point
	[] call FHC_fnc_factorioUpdateRequest;
} else {
	hint "Verdammt! Dein Fahrzeug konnte nicht Produziert werden. Check mal, ob wer den Spawnpunkt blockiert!";
};

life_is_processing = false;