#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop","_localDonatorDiscount"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

//DonatorDiscount
_localDonatorDiscount = __GETC__(life_donator);
_localDonatorDiscount = 1 - (_localDonatorDiscount * 0.1);


switch(_shop) do
{
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Arzt!"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,100],
						["FirstAidKit",nil,350],
						["Medikit",nil,250],
						["ToolKit",nil,250],
						["NVGoggles",nil,750],
						["B_Bergen_Base",nil,500]
					]
				];
			};
		};
	};

	case "adac_basic":
	{
		switch (true) do 
		{
			case (playerSide != east): {"Du gehoerst nicht zum ATAC!"};
			default {
				["ATAC Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["NVGoggles",nil,750],
						["B_Bergen_Base",nil,500]
					]
				];
			};
		};
	};

	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du gehoerst nicht zum AMOK Sicherheitsdienst!"};
			default
			{
				[" AMOK Ausruestung",
					[
						["hgun_P07_snds_F","Taser",500],
						["16Rnd_9x21_Mag",nil,25],
						["arifle_sdar_F","Taser Gewehr",1500],
						["20Rnd_556x45_UW_mag","Taser Gewehrmagazin",75],
						["ItemGPS",nil,100],
						["Binocular",nil,100],
						["NVGoggles",nil,750],
						["ToolKit",nil,250],
						["FirstAidKit",nil,350],
						["hgun_P07_F",nil,500],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,2500],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_MX_F",nil,7000],
						["30Rnd_65x39_caseless_mag",nil,50],
						["hgun_ACPC2_F",nil,500],
						["9Rnd_45ACP_Mag",nil,25],
						["arifle_MXC_F",nil,7000],
						["arifle_MXM_F",nil,9225],
						["30Rnd_65x39_caseless_mag",nil,50],
						["srifle_EBR_F",nil,17500],
						["20Rnd_762x51_Mag",nil,75],
						["LMG_Mk200_F",nil,25000],
						["200Rnd_65x39_cased_Box",nil,100],
						["srifle_LRR_F",nil,19500],
						["7Rnd_408_Mag",nil,175],
						["srifle_GM6_F",nil,35000],
						["5Rnd_127x108_Mag",nil,250],
						["acc_flashlight",nil,50],
						["optic_Aco_smg",nil,100],
						["optic_Arco",nil,150],
						["optic_Holosight",nil,200],
						["optic_MRCO",nil,300],
						["optic_SOS",nil,1000],
						["muzzle_snds_acp",nil,275],
						["muzzle_snds_L",nil,345],
						["muzzle_snds_H",nil,455],
						["muzzle_snds_H_MG",nil,555],
						["muzzle_snds_B",nil,655],
						["Rangefinder",nil,500],
						["MineDetector",nil,100]
					]
				];
			};
		};
	};

	/*
	case "cop_advanced":
	{
		switch (true) do 
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 1): {"Du hast nicht den Dienstgrad!"};
			default
			{
				["Polizeiausruestung",
					[
						["hgun_P07_F",nil,500],
						["16Rnd_9x21_Mag",nil,25],
						["SMG_02_F",nil,1500],
						["30Rnd_9x21_Mag",nil,75],
						["acc_flashlight",nil,50],
						["optic_Aco_smg",nil,100]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 5): {"Du hast nicht den Dienstgrad!"};
			default
			{
				["Bundespolizei",
					[
						["SMG_02_F",nil,1500],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_MX_F",nil,5000],
						["30Rnd_65x39_caseless_mag",nil,50],
						["acc_flashlight",nil,50],
						["optic_Aco_smg",nil,100],
						["optic_Arco",nil,150],
						["optic_Holosight",nil,200],
						["MineDetector",nil,100]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case (__GETC__(life_coplevel) < 8): {"Du hast nicht den Dienstgrad!"};
			default
			{
				["SEK",
					[
						["hgun_ACPC2_F",nil,500],
						["9Rnd_45ACP_Mag",nil,25],
						["SMG_02_F",nil,1500],
						["30Rnd_9x21_Mag",nil,75],
						["arifle_MXC_F",nil,5000],
						["arifle_MXM_F",nil,7225],
						["30Rnd_65x39_caseless_mag",nil,50],
						["srifle_EBR_F",nil,7500],
						["20Rnd_762x51_Mag",nil,75],
						["LMG_Mk200_F",nil,10000],
						["200Rnd_65x39_cased_Box",nil,100],
						["srifle_LRR_F",nil,12500],
						["7Rnd_408_Mag",nil,175],
						["srifle_GM6_F",nil,25000],
						["5Rnd_127x108_Mag",nil,250],
						["acc_flashlight",nil,50],
						["optic_Aco_smg",nil,100],
						["optic_Arco",nil,150],
						["optic_Holosight",nil,200],
						["optic_MRCO",nil,300],
						["optic_SOS",nil,1000],
						["optic_tws",nil,5000],
						["optic_tws_mg",nil,8000],
						["muzzle_snds_acp",nil,275],
						["muzzle_snds_L",nil,345],
						["muzzle_snds_H",nil,455],
						["muzzle_snds_H_MG",nil,555],
						["muzzle_snds_B",nil,655],
						["Rangefinder",nil,500]
					]
				];
			};
		};
	};
	*/
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Du das darfst du nicht!"};
			case (!license_civ_rebel): {"Du bist kein Rebelle!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag",nil,100],
						["arifle_TRG20_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,150],
						["arifle_Katiba_F",nil,45000],
						["30Rnd_65x39_caseless_green",nil,225],
						["srifle_DMR_01_F",nil,75000],
						["10Rnd_762x51_Mag",nil,375],
						["srifle_LRR_F",nil,120000],
						["7Rnd_408_Mag",nil,600],
						["acc_flashlight",nil,500],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,4000],
						["optic_Hamr",nil,6500],
						["optic_SOS",nil,10500]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Das darfst du nicht!"};
			//case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Harry's Feuerwaffen",
					[
						["hgun_Rook40_F",nil,2500 * _localDonatorDiscount],
						["16Rnd_9x21_Mag",nil,10 * _localDonatorDiscount],
						["hgun_Pistol_heavy_02_F",nil,5000 * _localDonatorDiscount],
						["6Rnd_45ACP_Cylinder",nil,20 * _localDonatorDiscount],
						["hgun_ACPC2_F",nil,7500 * _localDonatorDiscount],
						["9Rnd_45ACP_Mag",nil,30 * _localDonatorDiscount],
						["hgun_PDW2000_F",nil,17500 * _localDonatorDiscount],
						["30Rnd_9x21_Mag",nil,70 * _localDonatorDiscount],
						["optic_ACO_grn_smg",nil,3500 * _localDonatorDiscount],
						["V_Rangemaster_belt",nil,250 * _localDonatorDiscount]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis Ausruestungbedarf",
			[
				["Binocular",nil,100],
				["ItemGPS",nil,100],
				["FirstAidKit",nil,500],
				["NVGoggles",nil,1000],
				["ToolKit",nil,650]
			]
		];
	};
};
