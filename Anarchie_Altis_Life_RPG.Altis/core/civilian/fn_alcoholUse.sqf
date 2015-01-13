/*
	File: fn_alcoholUse.sqf
	Author: Zero
	
	Description:
	Alcohol Handling.
*/
private["_drink","_addalc"];

_drink = [_this,0,""] call BIS_fnc_param;

if(_drink == "") exitWith {};

_addalc = player getVariable["alcohol",0];

if(_addalc > 4)exitWith{};

if(_drink == "beer")then
{
	_addalc = _addalc + 0.2;
	if(life_thirst < 80)then
	{
		life_thirst = life_thirst + 20;
	}
	else
	{
		life_thirst = 100;
	};
};

if(_drink == "applewine")then
{
	_addalc = _addalc + 0.5;
	if(life_thirst < 90)then
	{
		life_thirst = life_thirst + 10;
	}
	else
	{
		life_thirst = 100;
	};

	if(life_hunger < 90)then
	{
		life_hunger = life_hunger + 10;
	}
	else
	{
		life_hunger = 100;
	};
};

if(_drink == "wodka")then
{
	_addalc = _addalc + 1;
	if(life_thirst < 95)then
	{
		life_thirst = life_thirst + 5;
	}
	else
	{
		life_thirst = 100;
	};

	if(life_hunger > 20)then
	{
		life_hunger = life_hunger - 10;
	}
	else
	{
		life_hunger = 10;
	};
};

player setVariable["alcohol",_addalc,true];

if(_addalc > 3.5)then
{
	life_alctoxic = true;
	hint "Du erleidest eine Alcohol vergiftng! \n Suche so schnell wie möglich eine Arzt auf!!";
};


if(!life_alcohol)then{

	[] spawn life_fnc_alcoholCircle;
		
};
	