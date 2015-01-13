/*
	File: fn_adacFetchGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches specific key items from the medics for a persistent state.
*/
private["_ret","_uItems","_bItems","_yItems","_name","_val"];
_ret = [];

_ret set[count _ret,uniform player];
_ret set[count _ret,backpack player];
_ret set[count _ret,goggles player];
_ret set[count _ret,headgear player];
_ret set[count _ret,assignedItems player];

_uItems = [];
_bItems = [];
//added by preller
_yItems = [];

if(uniform player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_uItems set[count _uItems,_x];
		};
	} foreach (uniformItems player);
};

if(backpack player != "") then
{
	{
		_info = [_x] call life_fnc_fetchCfgDetails;
		if((_info select 4) in [4096,131072]) then
		{
			_bItems set[count _bItems,_x];
		};
	} foreach (backpackItems player);
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
	["life_inv_honeyp",life_inv_honeyp],["life_inv_grape",life_inv_grape],["life_inv_pear",life_inv_pear]
];

_ret set[count _ret,_uItems];
_ret set[count _ret,_bItems];

//next line added by preller. taken from vampire
_ret set[count _ret,_yItems];

adac_gear = _ret;