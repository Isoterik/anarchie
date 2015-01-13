/*
	Author: Zero
	Copyright (C) 2014
*/


ZCT_BoostToggle = false;

waituntil {!(IsNull (findDisplay 46))};


ZCT_boost_on = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 2) && (vehicle player) != player && ((vehicle player) getVariable [""boost"",[false]] select 0) && !((vehicle player) getVariable ""boost"" select 1) && !ZCT_BoostToggle) then {[] spawn ZCT_fnc_UseBoost; ZCT_BoostToggle = true;};"];

ZCT_boost_off = (findDisplay 46) displayAddEventHandler ["KeyUp","if ((_this select 2) && (vehicle player) != player && ((vehicle player) getVariable [""boost"",[false]] select 0) && ((vehicle player) getVariable [""boost"",[false]] select 0)) then {ZCT_BoostToggle = false;};"];

ZCT_jump_on = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 4) && (vehicle player) != player && ((vehicle player) getVariable [""boost"",[false]] select 0)) then {ZCT_jump = true;};"];



/*

this allowDamage false;  this enableSimulation false;  
this addAction["Tunning",ZCT_fnc_AddBoost,"",0,false,false,"",' license_civ_driver && playerSide == civilian || playerSide == west '];
this addAction["Farbe ändern",ZCT_fnc_VehColor,"",0,false,false,"",' license_civ_driver && playerSide == civilian || playerSide == west '];
this addAction["Besitzer wechseln",ZCT_fnc_VehOwner,"",0,false,false,"",' license_civ_driver && playerSide == civilian || playerSide == west '];

*/