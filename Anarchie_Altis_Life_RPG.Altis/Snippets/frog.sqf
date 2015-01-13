
--- core/civilian/fn_zoneCreator.sqf

_frogZones = ["frog_1"];

//Create frog zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Frog = player addAction['Frösche Suchen',life_fnc_gatherFrog,'',0,false,false,'','!life_action_inUse'];","player removeAction LIFE_Action_Frog;"];
} foreach _frogZones;

--- functions.h
//in class Actions

class gatherFrog {};

--- core/actions/fn_gatherFrog.sqf (Neu Erstellen)

private["_sum"];
_sum = ["frog",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Suche nach Frösche...","PLAIN"];
	titleFadeOut 5;
	sleep 3;
	if((random 5) > 2)then
	{
		if(([true,"frog",1] call life_fnc_handleInv)) then
		{
			titleText["Du hast einen Frosch gefunden.","PLAIN"];
		};
	}else{
		titleText["Keinen Frosch gefunden.","PLAIN"];
	};
};

life_action_inUse = false;


--- core/actions/fn_processAction.sqf

case "froglsd": {["frog","froglsd",100,"Processing FrschLSD"]};
case "frogeat": {["frog","frogeat",100,"Processing Froschschenkel"]};

--- core/config/fn_licenseType.sqf

case "froglsd": {_var = "license_civ_froglsd"};
case "frogeat": {_var = "license_civ_frogeat"};

case "license_civ_froglsd": {_var = "froglsd"};
case "license_civ_frogeat": {_var = "frogeat"};


--- core/config/fn_licensePrice.sqf

case "froglsd": {30000};
case "frogeat": {30000};

--- core/configuration.sqf

"life_inv_frog",
"life_inv_froglsd",
"life_inv_frogeat",

["license_civ_froglsd","civ"],
["license_civ_frogeat","civ"],

//sell
["froglsd",3800],
["frogeat",3500],

--- core/config/fn_itemWeight.sqf

case "frog": {4};
case "froglsd": {2};
case "frogeat": {2};

--- core/config/fn_virt_shops.sqf

case "froglsd": {["Drug Dealer",["froglsd"]]};
case "frogeat": {["Frog Dealer",["frogeat"]]};

--- core/config/fn_varHandle.sqf

case "frog": {"life_inv_frog"};
case "froglsd": {"life_inv_froglsd"};
case "frogeat": {"life_inv_frogeat"};

case "life_inv_frog": {"frog"};
case "life_inv_froglsd": {"froglsd"};
case "life_inv_frogeat": {"frogeat"};

--- core/config/fn_varToStr.sqf

case "life_inv_frog": {"Frosch"};
case "life_inv_froglsd": {"FroschLSD"};
case "life_inv_frogeat": {"Froschschenkel"};

case "license_civ_froglsd": {"FroschLSD Training"};
case "license_civ_frogeat": {"Froschschenkel Training"};


--- map!! ---

--- gebiet

frog_1

--- bearbeitung npc


-LSD-

this enableSimulation false; 
this allowDamage false; 
this addAction["Frosch zu LSD verarbeiten",life_fnc_processAction,"froglsd",0,false,false,"",' life_inv_frog > 0 && !life_is_processing']; 
this addAction[format["%1 ($%2)",["license_civ_froglsd"] call life_fnc_varToStr,[(["froglsd"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"froglsd",0,false,false,"",' !license_civ_froglsd && playerSide == civilian '];


-Schenkel-

this enableSimulation false; 
this allowDamage false; 
this addAction["Froschschenkel Herstellen",life_fnc_processAction,"frogeat",0,false,false,"",' life_inv_frog > 0 && !life_is_processing']; 
this addAction[format["%1 ($%2)",["license_civ_frogeat"] call life_fnc_varToStr,[(["frogeat"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"frogeat",0,false,false,"",' !license_civ_frogeat && playerSide == civilian '];

-Frog trader-

this allowDamage false; this enableSimulation false; this addAction["Froschschenkel Handel",life_fnc_virt_menu,"frogeat"];