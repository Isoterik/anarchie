/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: preller @ freudenhaus <codepreller@hirnstrom.net>
	
	Description:
	Catch a fish with the fishing pole
*/
private["_fish","_type","_typeName","_random"];

_random = floor (random 10);
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_action_inUse = true;

titleText["Du wirfst die Angel aus.","PLAIN"];
sleep 5;

if(count _fish == 0) exitWith {
		titleText["Es hat kein Fisch angebissen!","PLAIN"];	
		sleep 1;
		life_action_inUse = false;
};

switch(_fish select 0) do
{
	case ((typeOf _x) == "Salema_F"): {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
	case ((typeOf _x) == "Ornate_random_F") : {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
	case ((typeOf _x) == "Mackerel_F") : {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
	case ((typeOf _x) == "Tuna_F") : {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
	case ((typeOf _x) == "Mullet_F") : {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
	case ((typeOf _x) == "CatShark_F") : {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
	default {_type = "";};
};

if (_random < 5) exitWith {
		titleText[format["Der Fisch ist entkommen. Es war wohl ein %1",_typeName],"PLAIN"];
		sleep 1;
		life_action_inUse = false;
};

if(([true,_type,1] call life_fnc_handleInv)) then
{
	deleteVehicle _x;
	titleText[format["Du hast %1 gefangen",_typeName],"PLAIN"];
};

sleep 1;
life_action_inUse = false;