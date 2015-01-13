/*
	File: fn_wantedInfo.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pulls back information about the wanted criminal.
*/
private["_display","_list","_crimes","_bounty","_mylist"];
disableSerialization;

_display = findDisplay 2400;
_list = _display displayCtrl 2402;
_data = lbData[2401,(lbCurSel 2401)];
_mylist = [];
_data = call compile format["%1", _data];
if(isNil "_data") exitWith {_list lbAdd "Failed to fetch crimes";};
if(typeName _data != "ARRAY") exitWith {_list lbAdd "Failed to fetch crimes";};
if(count _data == 0) exitWith {_list lbAdd "Failed to fetch crimes";};
lbClear _list;

_crimes = _data select 2;
_bounty = _data select 3;
	
{
	_crime = _x;
	diag_log _crime;

	//next lines added by preller. get crime name
	_type = [_crime] call life_fnc_wantedListCfg;

	diag_log format["type: %1",_type];

	_crimeName = _type select 0;

	diag_log format["wantedInfo crimename: %1",_crimeName];

	if(!(_crime in _mylist)) then
	{
		_mylist set[count _mylist,_crime];

		//next line edited by preller: changed _crime to _crimeName
		_list lbAdd format["%1 mal %2",{_x == _crime} count _crimes,_crimeName];
	};
} foreach _crimes;

ctrlSetText[2403,format["Momentane Belohnung: $%1",[_bounty] call life_fnc_numberText]];