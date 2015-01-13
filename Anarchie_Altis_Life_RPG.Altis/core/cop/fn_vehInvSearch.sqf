#include <macro.h>
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/

//next line edited by preller. added _trunk, _vWeight, _legal_item_weight, _illegal_item_weight, _ratio, _random, _isHidden
private["_vehicle","_vehicleInfo","_value","_ownerId","_ownerName","_vWeight","_legal_item_weight","_illegal_item_weight","_isHidden","_random","_ratio"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint localize "STR_Cop_VehEmpty"};

//next lines added by preller. initialize variables
_legal_item_weight = 0;
_illegal_item_weight = 0;

_veh_data = [_vehicle] call life_fnc_vehicleWeight;

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_index = [_var,life_illegal_items] call TON_fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,__GETC__(sell_array)] call TON_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((__GETC__(sell_array) select _vIndex) select 1));

			//next line added by preller. add item weight to the total weight of all illegal items
			_illegal_item_weight = _illegal_item_weight + (([_var] call life_fnc_itemweight) * _val);

		};
	//next lines added by preller. add legal items to the trunk
	} else {
		//next line added by preller. add item weight to the total weight of all legal items
		_legal_item_weight = _legal_item_weight + (([_var] call life_fnc_itemweight) * _val);
	};
} foreach (_vehicleInfo select 0);

//next lines added by preller. calculate to find the drugs
_vWeight = _legal_item_weight + _illegal_item_weight;
_ratio = 0;
if (_vWeight != 0) then {
	_ratio = round((_legal_item_weight * 100) / _vWeight);
};

_random = floor(random 100);
_isHidden = false;

if (_random <= _ratio) then {
	_isHidden = true;
};

if (_value > 0 && (!_isHidden)) then
{
	//hint "fahrzeug hat drogen in sich";
	//_ownerObj = owner _vehicle;
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	sleep 0.2;
	_ownerId = (_vehicleData select 0) select 0;
	sleep 0.2;
	_ownerName = (_vehicleData select 0) select 1;
	if((_value > 1) && (_value <= 3200)) then
	{
		[[_ownerId, _ownerName,"305"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
	if((_value > 3200) && (_value <= 10000)) then
{
		[[_ownerId, _ownerName,"307"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;    
	};
	if((_value > 10000) && (_value <= 20000)) then
	{
		[[_ownerId, _ownerName,"315"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;    
	};
	if(_value > 20000) then
	{
		[[_ownerId, _ownerName,"317"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;    
	};

	[[0,format[localize "STR_NOTF_VehContraband",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	life_atmcash = life_atmcash + _value;

	_vehicle setVariable["Trunk",[],true];
}
	else
{
	hint localize "STR_Cop_NoIllegalVeh";
};