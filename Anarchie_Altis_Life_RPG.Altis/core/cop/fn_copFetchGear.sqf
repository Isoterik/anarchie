/*
	File: fn_copFetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Saves the cops gear in a formatted array.
*/
private["_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_curWep","_yItems"];

//Old format / code
_primary = primaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
_primitems = primaryWeaponItems player;
_secitems = secondaryWeaponItems player;
_handgunitems = handGunItems player;
_uitems = [];
_vitems = [];
_bitems = [];
_yItems = [];

if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(goggles player != "") then { _items set[count _items, goggles player]; };
if(headgear player != "") then { _items set[count _items, headgear player]; };
if(count (primaryWeaponMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (primaryWeaponMagazine player);
};

if(count (handgunMagazine player) > 0) then
{
	{
		_magazines set[count _magazines,_x];
	} foreach (handgunMagazine player);
};

//Hard code for Laser Desigantor batteries
_curWep = currentWeapon player;
if("Laserdesignator" in assignedItems player) then
{
	player selectWeapon "Laserdesignator";
	if(currentMagazine player != "") then {_magazines set[count _magazines,(currentMagazine player)];};
};

//next line added by preller. taken from vampire
{
    _name = (_x select 0);
    _val = (_x select 1);
    if (_val > 0) then {
        for "_i" from 1 to _val do {
            _yItems = _yItems + [_name];
        };
    };
} forEach [
    ["life_inv_apple",life_inv_apple],["life_inv_rabbit",life_inv_rabbit],["life_inv_salema",life_inv_salema],["life_inv_ornate",life_inv_ornate],
    ["life_inv_mackerel",life_inv_mackerel],["life_inv_tuna",life_inv_tuna],["life_inv_mullet",life_inv_mullet],["life_inv_catshark",life_inv_catshark],
    ["life_inv_fishingpoles",life_inv_fishingpoles],["life_inv_water",life_inv_water],["life_inv_donuts",life_inv_donuts],["life_inv_turtlesoup",life_inv_turtlesoup],
    ["life_inv_coffee",life_inv_coffee],["life_inv_fuelF",life_inv_fuelF],["life_inv_fuelE",life_inv_fuelE],["life_inv_pickaxe",life_inv_pickaxe],
    ["life_inv_tbacon",life_inv_tbacon],["life_inv_lockpick",life_inv_lockpick],["life_inv_redgull",life_inv_redgull],["life_inv_peach",life_inv_peach],
	["life_inv_beer",life_inv_beer],["life_inv_applewine",life_inv_applewine],["life_inv_wodka",life_inv_wodka],["life_inv_proteinshake",life_inv_proteinshake],
	["live_inv_ziptie",life_inv_ziptie],["life_inv_bunp",life_inv_bunp],["life_inv_cheesestickp",life_inv_cheesestickp],["life_inv_sausage",life_inv_sausage],
	["life_inv_honeyp",life_inv_honeyp],["life_inv_grape",life_inv_grape],["life_inv_pear",life_inv_pear],["life_inv_goldendonat",life_inv_goldendonat],
	["life_inv_spikeStrip",life_inv_spikeStrip]
];

player selectWeapon _curWep;

cop_gear = [_primary,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_yItems];