/*
	File: fn_handleInv.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	add or deleate items from the factorio inv
*/
private["_math","_item","_num","_return","_var","_value"];
_math = [_this,0,false,[false]] call BIS_fnc_param; //true = add; false = subtract;
_item = [_this,1,"",[""]] call BIS_fnc_param; //The item we are using to add or remove.
_num = [_this,2,0,[0]] call BIS_fnc_param; //Number of items to add or remove.
if(_item == "" OR _num == 0) exitWith {false};

_var = [_item,0] call life_fnc_varHandle;
_value = missionNamespace getVariable _var;

if(_math) then
{
	//Lets add!
	missionNamespace setVariable[_var,(_value + _num)];
	
	if((missionNamespace getVariable _var) > _value) then {
		_return = true;

	} else {
		_return = false;
		
	};
} else {
	//Lets subtract!
	if((_value - _num) < 0) then
	{
		_return = false;
	}
		else
	{
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
		{
			_return = true;
		}
			else
		{
			_return = false;
		};
	};
};

_return;