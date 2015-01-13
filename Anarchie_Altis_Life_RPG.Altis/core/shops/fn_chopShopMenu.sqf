/*
	File: fn_chopShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens & initializes the chop shop menu.
*/
if(vehicle player != player)exitwith{hint "Du musst erst aussteigen!";};
if(life_action_inUse) exitWith {hint "Du kannst es grade nicht..."};
disableSerialization;
private["_nearVehicles","_control"];
_nearVehicles = nearestObjects [getMarkerPos (_this select 3),["Car","Truck"],25];

life_chopShop = (_this select 3);
//Error check
if(count _nearVehicles == 0) exitWith {titleText["Da sind kein Fahrzeuge zum verkaufen.","PLAIN"];};
if(!(createDialog "Chop_Shop")) exitWith {hint "Ups, da ist was schiefgelaufen."};

_control = ((findDisplay 39400) displayCtrl 39402);
{
	if(alive _x) then {
		_className = typeOf _x;
		_displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

		_ind = [_className,(call life_chop_sell)] call fnc_index;		
		if(_ind != -1 && count crew _x == 0) then {
			_price = ((call life_chop_sell) select _ind) select 1;
			_control lbAdd _displayName;
			_control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
			_control lbSetPicture [(lbSize _control)-1,_picture];
			_control lbSetValue [(lbSize _control)-1,_price];
		};
	};
} foreach _nearVehicles;