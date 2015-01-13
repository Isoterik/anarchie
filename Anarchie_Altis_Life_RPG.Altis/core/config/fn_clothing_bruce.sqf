/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_C_Poor_1",nil,100],
			["U_C_Poloshirt_blue",nil,250],
			["U_C_Poloshirt_burgundy",nil,275],
			["U_C_Poloshirt_redwhite",nil,150],
			["U_C_Poloshirt_salmon",nil,175],
			["U_C_Poloshirt_stripped",nil,125],
			["U_C_Poloshirt_tricolour",nil,350],
			["U_IG_Guerilla2_2",nil,450],
			["U_IG_Guerilla2_3",nil,580],
			["U_IG_Guerilla3_1",nil,635],
			["U_IG_Guerilla3_2",nil,735],
			["U_C_HunterBody_grn",nil,890],
			["U_C_WorkerCoveralls",nil,960],
			["U_C_Journalist",nil,1100],
			["U_Competitor",nil,1600],
			["U_OrestesBody",nil,1700],
			["U_NikosAgedBody",nil,2400],
			["U_NikosBody",nil,3600]
			  	
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_oli",nil,150],
			["H_Cap_red",nil,150],
			["H_Cap_tan",nil,150],
			["H_Cap_blu",nil,150],
			["H_Cap_grn",nil,150],
			["H_Cap_grn_BI",nil,150],
			["H_Cap_blk_CMMG",nil,150],
			["H_Cap_blk_ION",nil,150],
			["H_Hat_blue",nil,250],
			["H_Hat_brown",nil,250],
			["H_Hat_checker",nil,250],
			["H_Hat_grey",nil,250],
			["H_Hat_tan",nil,250],
			["H_StrawHat",nil,300],
			["H_StrawHat_dark",nil,300],
			["H_Bandanna_gry",nil,360],
			["H_Bandanna_cbr",nil,360],
			["H_Bandanna_surfer",nil,360],
			["H_Bandanna_khk",nil,360],
			["H_Bandanna_sgg",nil,360],
			["H_BandMask_blk",nil,360],
			["H_Booniehat_tan",nil,425]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Squares",nil,10],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Lowprofile",nil,30],
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,25],
			["G_Combat",nil,55],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			// Civ Backpacks from small to big
			["B_AssaultPack_rgr",nil,50],
			["B_AssaultPack_cbr",nil,50],
			["B_AssaultPack_sgg",nil,50],
			["B_AssaultPack_blk",nil,50],
			["B_AssaultPack_cbr",nil,50],
			["B_FieldPack_khk",nil,150],
			["B_FieldPack_cbr",nil,150],
			["B_FieldPack_blk",nil,150],
			["B_Kitbag_rgr",nil,300],
			["B_Kitbag_sgg",nil,300],
			["B_Kitbag_cbr",nil,300],
			["B_Bergen_sgg",nil,500],
			["B_Bergen_rgr",nil,500],
			["B_TacticalPack_oli",nil,500],
			["B_Bergen_blk",nil,500],
			["B_Carryall_oli",nil,750],
			["B_Carryall_khk",nil,750]
		];
	};
};