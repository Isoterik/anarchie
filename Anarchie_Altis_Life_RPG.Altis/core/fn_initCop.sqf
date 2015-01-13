#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

//Check for Blacklistentry.
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15","cop_16","cop_17","cop_18","cop_19","cop_20","cop_21","cop_22","cop_23","cop_24","cop_25","cop_26","cop_27","cop_28","cop_29","cop_30"])) then 
	{

		if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
		};
		
		/*
		switch(__GETC__(life_coplevel))do
		{	
			case 1:{life_paycheck = 300;}; //Paycheck Amount
			case 2:{life_paycheck = 350;}; //Paycheck Amount
			case 3:{life_paycheck = 400;}; //Paycheck Amount
			case 4:{life_paycheck = 550;}; //Paycheck Amount
			case 5:{life_paycheck = 550;}; //Paycheck Amount				
			case 6:{life_paycheck = 450;}; //Paycheck Amount
			case 7:{life_paycheck = 600;}; //Paycheck Amount
			case 8:{life_paycheck = 600;}; //Paycheck Amount
			case 9:{life_paycheck = 500;}; //Paycheck Amount				
			case 10:{life_paycheck = 650;}; //Paycheck Amount
			case 11:{life_paycheck = 650;}; //Paycheck Amount
			case 12:{life_paycheck = 1300;}; //Paycheck Amount
			case 13:{life_paycheck = 1300;}; //Paycheck Amount
		};
		*/
	};

/*
if((__GETC__(life_coplevel) < 1) && (__GETC__(life_adminlevel) == 0)) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
};
*/


//Make the Coplevel visible for Scripts executed on another client then the Cop
player setVariable["rank",(__GETC__(life_coplevel)),true];

//alt
//player setVariable["coplevel",__GETC__(life_coplevel),true];

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.