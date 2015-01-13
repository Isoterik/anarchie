/*
	File: fn_adacDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default medic configuration.
*/
//Strip the player down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Load player with default medic gear.
player addUniform "U_IG_Guerilla2_3";
player setObjectTextureGlobal [0,"textures\clothing\med\notarzt.paa"];
player addBackpack "B_Bergen_Base";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemWatch";
player assignItem "ItemWatch";