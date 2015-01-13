/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};
	
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["textures\vehicles\civ\offroad\offroad_cyan.paa","civ"],
			["textures\vehicles\civ\offroad\offroad_monster.paa","civ"],
			["textures\vehicles\civ\offroad\taxi_Offroad.paa","civ"],
			["textures\vehicles\civ\offroad\dhl_Offroad.paa","civ"],
			["textures\vehicles\civ\offroad\ziv_offroad.paa","civ"],
			["textures\vehicles\adac\adac_offroad.paa","adac"],
			["textures\vehicles\cop\sec_offroad.paa","cop"],
			["textures\vehicles\med\arzt_offroad.paa","med"]				
		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\vehicles\civ\limo\hellokitty.paa","civ"],
			["textures\vehicles\civ\limo\metallica.paa","civ"],
			["textures\vehicles\civ\limo\blue_limo.paa","civ"],
			["textures\vehicles\civ\limo\pimp_limo.paa","civ"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\vehicles\civ\limo\hellokitty.paa","civ"],
			["textures\vehicles\civ\limo\metallica.paa","civ"],
			["textures\vehicles\civ\limo\blue_limo.paa","civ"],
			["textures\vehicles\civ\limo\pimp_limo.paa","civ"],
			["textures\vehicles\civ\limo\ken_block.paa","civ"]
		];
	};
				
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\vehicles\civ\suv\BatmanSuV.paa","civ"],
			["textures\vehicles\civ\suv\supermanSuV.paa","civ"],
			["textures\vehicles\civ\suv\suv_camo.paa","civ"],
			["textures\vehicles\civ\suv\suv_fast.paa","civ"],
			["textures\vehicles\civ\suv\suv_kitty.paa","civ"],
			["textures\vehicles\civ\suv\suv_taxi.paa","civ"],
			["textures\vehicles\civ\suv\suv_vip.paa","civ"],
			["textures\vehicles\civ\suv\suv_reb.paa","civ"],
			["textures\vehicles\civ\suv\suv_carbon1.paa","civ"],
			["textures\vehicles\civ\suv\suv_carbon2.paa","civ"],
			["textures\vehicles\cop\sec_suv.paa","cop"],
			["textures\vehicles\med\arzt_suv.paa","med"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "C_Van_01_fuel_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\soft_f\Quadbike_01\Data\quadbike_01_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_ig_co.paa","civ"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"],
			["textures\vehicles\civ\hummingbird\homo3.paa","civ"],
			["textures\vehicles\civ\hummingbird\Homo4.paa","civ"],
			["textures\vehicles\civ\hummingbird\reblbirdcamo1.paa","civ"],
			["textures\vehicles\med\adacheli.paa","med"],
			["textures\vehicles\cop\sec_hummingbird.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["textures\vehicles\med\adacheli.paa","adac"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\vehicles\cop\sec_orca.paa","cop"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["textures\vehicles\cop\sec_hunter1.paa","cop","textures\vehicles\cop\sec_hunter2.paa"]
		];
	};

	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["textures\vehicles\cop\sec_hunter1.paa","cop","textures\vehicles\cop\sec_hunter2.paa"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"]
		];
	};

	case "I_Truck_02_box_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_repair_co.paa"],
			["textures\vehicles\adac\adac_truck1.paa","adac","textures\vehicles\adac\adac_truck2.paa"]
		];
	};

	case "O_Truck_02_fuel_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_fuel_co.paa"]
		];
	};
	
	/*
	case "O_Truck_03_fuel_F":
	{
		_path = "textures\vehicles\civ\trucks\";
		_ret =
		[
			[_path + "tempestcab1.paa","civ",_path + "tempestcab2.paa",_path + "tempestfuel.paa"]
		];
	};
	*/
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["\a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa","civ"],
			["textures\vehicles\civ\Strider\civ_strider.paa","civ"],
			["textures\vehicles\civ\Strider\civ_strider_black.paa","civ"],
			["textures\vehicles\civ\Strider\civ_strider_White.paa","civ"],
			["textures\vehicles\civ\Strider\strider_gis.paa","civ"],
			["textures\vehicles\cop\sec_strider1.paa","cop","textures\vehicles\cop\sec_strider2.paa"]
		];
	};
	case "B_Heli_Transport_01_F":
	{
		_ret = 
		[
			["textures\vehicles\cop\sec_ghost1.paa","cop","textures\vehicles\cop\sec_ghost2.paa"]
		];
	};

	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["textures\vehicles\cop\sec_hellcat.paa","cop"]
		];
	};
};

_ret;