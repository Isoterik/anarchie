#include <macro.h>
/*
	File: fn_updateTexture.sqf
	Author: Stone 
	
	Description:
	Sets custom Texture to Uniform and Backpack.
*/

private["_uniform","_backpack","_playerside","_coplevel","_runOnce"];
_uniform = uniform player;
_backpack = unitBackpack player;
_playerside = side player;
_coplevel = __GETC__(life_coplevel);
_runOnce = [_this, 0, false] call BIS_fnc_param;


if (!(_runonce)) then
{
	if(_playerside == west) then
	{
		// Function to Retexture the Cops Backpack every time it is needed to.
		[] spawn 
		{
			while {true} do
			{
				waitUntil {typeOf (unitBackpack player) == "B_Bergen_Base"};
				[[unitBackpack player,"textures\clothing\cop\secrucksack.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				waitUntil {typeOf (unitBackpack player) != "B_Bergen_Base"};
			};
		};

		// Function to Retexture the Cops Outfit every time it is needed to.
		switch(_coplevel) do 
		{

			case 0:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_B_CombatUniform_mcam_vest"};
						[[player,"textures\clothing\cop\secuniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_B_CombatUniform_mcam_vest"};
					};
				};
			};

			case 1:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_Rangemaster"};
						[[player,"textures\clothing\cop\polizeianwaerter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_Rangemaster"};
					};
				};
			};
		
			case 2:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_Rangemaster"};
						[[player,"textures\clothing\cop\polizeimeister.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_Rangemaster"};
					};
				};
			};
			
			case 3:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_Rangemaster"};
						[[player,"textures\clothing\cop\polizeikommissar.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_Rangemaster"};
					};
				};
			};

			case 4:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_Rangemaster"};
						[[player,"textures\clothing\cop\polizeistellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_Rangemaster"};
					};
				};
			};

			case 5:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_Rangemaster"};
						[[player,"textures\clothing\cop\polizeileiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_Rangemaster"};
					};
				};
			};		
			
			case 6:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_I_CombatUniform_tshirt"};
						[[player,"textures\clothing\cop\bunduniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_I_CombatUniform_tshirt"};
					};
				};
			};

			case 7:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_I_CombatUniform_tshirt"};
						[[player,"textures\clothing\cop\bpstellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_I_CombatUniform_tshirt"};
					};
				};
			};

			case 8:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_I_CombatUniform_tshirt"};
						[[player,"textures\clothing\cop\bpleiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_I_CombatUniform_tshirt"};
					};
				};
			};
			
			case 9:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_I_G_resistanceLeader_F"};
						[[player,"textures\clothing\cop\sekuniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_I_G_resistanceLeader_F"};
					};
				};
			};
			
			case 10:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_B_CombatUniform_mcam_vest"};
						[[player,"textures\clothing\cop\sekstellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_B_CombatUniform_mcam_vest"};
					};
				};
			};

			case 11:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_B_CombatUniform_mcam_vest"};
						[[player,"textures\clothing\cop\sekleiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_B_CombatUniform_mcam_vest"};
					};
				};
			};
			
			case 12:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_B_CombatUniform_mcam"};
						[[player,"textures\clothing\cop\praesistellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_B_CombatUniform_mcam"};
					};
				};
			};

			case 13:
			{
				[] spawn 
				{
					while {true} do
					{
						waitUntil {Uniform player == "U_B_CombatUniform_mcam"};
						[[player,"textures\clothing\cop\praesident.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
						waitUntil {Uniform player != "U_B_CombatUniform_mcam"};
					};
				};
			};
		};
	};

	
	if(_playerside == independent) then
	{
		// Function to Retexture the Medics Outfit every time it is needed to.
		[]spawn
		{
			while {true} do
			{
				waitUntil {Uniform player == "U_IG_Guerilla2_3"};
				[[player,"textures\clothing\med\notarzt.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				waitUntil {Uniform player != "U_IG_Guerilla2_3"};
			};
		};
		// Function to Retexture the Medics Backpack every time it is needed to.
		[]spawn
		{
			while {true} do
			{
				waitUntil {typeOf (unitBackpack player) == "B_Bergen_Base"};
				[[unitBackpack player,"textures\clothing\med\arztrucksack.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				waitUntil {typeOf (unitBackpack player) != "B_Bergen_Base"};
			};
		};
	};
	
	if(_playerside == east) then
	{
		// Function to Retexture the adac Outfit every time it is needed to.
		[]spawn
		{
			while {true} do
			{
				waitUntil {Uniform player == "U_C_WorkerCoveralls"};
				[[player,"textures\clothing\adac\adacoverall.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				waitUntil {Uniform player != "U_C_WorkerCoveralls"};
			};
		};
		
		// Function to Retexture the adac Backpack every time it is needed to.
		[]spawn
		{
			while {true} do
			{
				waitUntil {typeOf (unitBackpack player) == "B_Bergen_Base"};
				[[unitBackpack player,"textures\clothing\adac\adacrucksack.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				waitUntil {typeOf (unitBackpack player) != "B_Bergen_Base"};
			};
		};
	};

} else {

	if(_playerside == west) then
	{
		// Function to Retexture the Cops Backpack every time it is needed to.
		if(typeOf (unitBackpack player) == "B_Bergen_Base") then
		{
			[[unitBackpack player,"textures\clothing\cop\polizeirucksack.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
		};
		
		
		// Function to Retexture the Cops Outfit every time it is needed to.
		switch(_coplevel) do 
		{
			case 0:
			{
				if(typeOf (unitBackpack player) == "U_B_CombatUniform_mcam_vest") then
				{
				[[unitBackpack player,"textures\clothing\cop\secuniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 1:
			{
				if (Uniform player == "U_Rangemaster") then
				{
					[[player,"textures\clothing\cop\polizeianwaerter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};
		
			case 2:
			{
				if (Uniform player == "U_Rangemaster") then
				{
					[[player,"textures\clothing\cop\polizeimeister.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 3:
			{
				if (Uniform player == "U_Rangemaster") then
				{
					[[player,"textures\clothing\cop\polizeikommissar.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 4:
			{
				if (Uniform player == "U_Rangemaster") then
				{
					[[player,"textures\clothing\cop\polizeistellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 5:
			{
				if (Uniform player == "U_Rangemaster") then
				{
					[[player,"textures\clothing\cop\polizeileiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 6:
			{
				if (Uniform player == "U_I_CombatUniform_tshirt") then
				{
					[[player,"textures\clothing\cop\bunduniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 7:
			{
				if (Uniform player == "U_I_CombatUniform_tshirt") then
				{
					[[player,"textures\clothing\cop\bpstellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 8:
			{
				if (Uniform player == "U_I_CombatUniform_tshirt") then
				{
					[[player,"textures\clothing\cop\bpleiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 9:
			{
				if (Uniform player == "U_I_G_resistanceLeader_F") then
				{
					[[player,"textures\clothing\cop\sekuniform.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 10:
			{
				if (Uniform player == "U_B_CombatUniform_mcam_vest") then
				{
					[[player,"textures\clothing\cop\sekstellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 11:
			{
				if (Uniform player == "U_B_CombatUniform_mcam_vest") then
				{
					[[player,"textures\clothing\cop\sekleiter.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};

			case 12:
			{
				if (Uniform player == "U_B_CombatUniform_mcam") then
				{
					[[player,"textures\clothing\cop\praesistellv.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};
			
			case 13:
			{
				if (Uniform player == "U_B_CombatUniform_mcam") then
				{
					[[player,"textures\clothing\cop\praesident.paa"], "life_fnc_setTexture", true, true] spawn life_fnc_MP;
				};
			};
		};
	};
};