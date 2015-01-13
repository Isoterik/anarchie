/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_crimeID"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;

//next line edited by preller: changed _type to _crimeID;
_crimeID = [_this,2,"",[""]] call BIS_fnc_param;

_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;

if(_uid == "" OR _crimeID == "" OR _name == "") exitWith {}; //Bad data passed.

//next line added by preller. get crime type.
_type = [_crimeID] call life_fnc_wantedListCfg;

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes set[count _crimes,_crimeID];
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];

	//next line added by preller: db update
	_newBounty = _val + (_type select 1);
	[_uid,_crimes,_newBounty] spawn life_fnc_wantedListUpdate;
}
	else
{
	life_wanted_list set[count life_wanted_list,[_name,_uid,[_crimeID],(_type select 1)]];
	diag_log format["CrimeID: %1",_crimeID];
	
	//next line added by preller: db insert
	[_name,_uid,[_crimeID],(_type select 1)] spawn life_fnc_wantedListInsert;
};