#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_isTanker","_isFluid"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Du kannst keine Zahl die kleiner ist als 1 eingeben!";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightConfig);} foreach (_house getVariable["containers",[]]);
	_totalWeight = [_maxWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Das passt nur in Bodenfahrzeuge!"};

//next lines added by preller. fuel storage vehicles only can store fluids
_isTanker = false;
{
	if (life_trunk_vehicle isKindOf _x) then {_isTanker = true;};
} forEach ["C_Van_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F"];

_isFluid = false;
{
	if (_ctrl == _x) then {_isFluid = true;};
} forEach ["oilu","oilp","milku","milkp"];

//check
if (_isTanker && (!_isFluid)) exitWith {hint "Du kannst nur Fluessigkeiten in einen Tanklaster fuellen!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call fnc_index;
	if(life_cash < _num) exitWith {hint "Du hast nicht soviel Geld dabei um es ins Fahrzeug zu legen!"};
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_cash = life_cash - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "Das Fahrzeug ist entweder voll oder kann soviel nicht laden."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Konnte diese Gegenstaende aus deinem Inventar nicht ins Fahrzeug legen.";};
	_index = [_ctrl,_inv] call fnc_index;
	if(_index == -1) then
	{
		_inv set[count _inv,[_ctrl,_num]];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
