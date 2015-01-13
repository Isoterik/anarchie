/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't matter, will be revised later.
*/
if(life_cash < 100) exitWith {hint format[localize "STR_NOTF_HS_NoCash",50];};
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];
if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];

life_alctoxic = false;
_addalc = player getVariable["alcohol",0];
_addalc = _addalc / 2;
player setVariable["alcohol",_addalc,true];

player setdamage 0;
life_cash = life_cash - 50;