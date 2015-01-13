/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main handling system for eating food.
	*Needs to be revised and made more modular and more indept effects*
*/
private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 20};
		case "peach": {_val = 20};
		case "tbacon": {_val = 50};
		case "rabbit":{ _val = 30};
		case "donuts": {_val = 50};
		case "goldendonat": {_val = 100};
		case "proteinshake": {_val = 100};
		case "frogeat": {_val = 20};
		case "ornate": {_val = 20};
		case "salema": {_val = 30};
		case "mullet": {_val = 50};
		case "mackerel": {_val = 60};
		case "tuna": {_val = 75};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 80};		
		case "honeyp": {_val = 50};
		case "cheesep": {_val = 35};
		case "bunp": {_val = 25};
		case "cheesestickp": {_val = 35};
		case "pear": {_val = 20};
		case "sausage": {_val = 70};
		case "grape": {_val = 20};
	};

	_sum = life_hunger + _val;
	if(_sum > 100) then {_sum = 100; player setFatigue 1; hint "Du hast zuviel gegessen, du brauchst eine Pause.";};
	life_hunger = _sum;
};