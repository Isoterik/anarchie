/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,500],
			["U_I_G_Story_Protagonist_F",nil,750],
			["U_BG_Guerilla1_1",nil,1150],
			["U_IG_leader","Guerilla Leader",1534],
			["U_O_PilotCoveralls",nil,1561],
			["U_I_pilotCoveralls",nil,1561],
			["U_I_HeliPilotCoveralls",nil,1561],
			["U_B_HeliPilotCoveralls",nil,1561],
			["U_O_CombatUniform_ocamo",nil,2050],
			["U_O_CombatUniform_oucamo",nil,2350],
			["U_O_GhillieSuit",nil,5000],
			["U_I_GhillieSuit",nil,5000],
			["U_B_GhillieSuit",nil,5000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_tan_specops_US",nil,35],
			["H_Cap_blk_Raven",nil,35],
			["H_Booniehat_dgtl",nil,45],
			["H_Booniehat_mcamo",nil,45],
			["H_Bandanna_camo",nil,55],
			["H_Bandanna_mcamo",nil,55],
			["H_ShemagOpen_khk",nil,80],
			["H_Shemag_olive",nil,85],
			["H_Shemag_tan",nil,85],
			["H_HelmetO_ocamo",nil,750],
			["H_HelmetLeaderO_oucamo",nil,750],
			["H_HelmetO_ocamo",nil,750],
			["H_HelmetO_oucamo",nil,750]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_cbr",nil,850],
			["V_TacVest_khk",nil,1250],
			["V_HarnessO_brn",nil,1450]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			// Reb Backpacks from small to big
		 	["B_AssaultPack_dgtl",nil,250],
   			["B_AssaultPack_mcamo",nil,250],
    		["B_FieldPack_ocamo",nil,700],
    		["B_FieldPack_oucamo",nil,700],
   			["B_Kitbag_mcamo",nil,1200],
   			["B_TacticalPack_mcamo",nil,1200],
   			["B_TacticalPack_ocamo",nil,1200],
    		["B_Bergen_mcamo",nil,1200],
    		["B_Carryall_ocamo",nil,1700],
    		["B_Carryall_oucamo",nil,1700],
    		["B_Carryall_mcamo",nil,1700]
		];
	};
};