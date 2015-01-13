#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 3; //Scaled in minutes
life_has_insurance = false;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;

//Persistent Saving
__CONST__(life_save_civ,FALSE); //Save weapons for civs?
__CONST__(life_save_yinv,FALSE); //Save Y-Inventory for players?

//bugfix for the speedfarmin bug with "windowkey" pressed while spamming space
life_action_gather = false;

//Blacklist.
life_blacklisted = 0;

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,250); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,100000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,25000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

life_cevlar = false;
life_holster_time = time;
life_holstered = false;
	
life_holstered_ammo = "";
life_holstered_weapon = "";
life_holstered_items = ["","","",life_holstered_ammo];
life_holstered_magazine = "";

life_alctoxic = false;
life_alcohol = false;

life_club1 = "";
life_club2 = "";

//emp
nn_last_vehicles = [];
nn_empInUse = false;

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 20; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 20; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 30;
life_eat_Ornate = 20;
life_eat_Mackerel = 60;
life_eat_Tuna = 75;
life_eat_Mullet = 50;
life_eat_CatShark = 100;
life_eat_Rabbit = 30;
life_eat_Apple = 20;
life_eat_turtlesoup = 80;
life_eat_donuts = 50;
life_eat_honeyp = 50;
life_eat_cheesep = 25;
life_eat_bunp = 25;
life_eat_cheesestickp = 35;
life_eat_pear = 35;
life_eat_sausage = 70;
life_eat_grape = 20;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,10); //Ten minutes
life_cash = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 5000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 2500; //Starting Bank Money
		life_paycheck = 150; //Paycheck Amount
	};
	
	case independent:
	{
		if (__GETC__(life_medicLevel) > 0) then
		{
			life_atmcash = 5000; //Starting Bank Money
		} else {
			life_atmcash = 2500; //Starting Bank Money
		};
		life_paycheck = 200; //Paycheck Amount
	};

	case east:
	{
		if (__GETC__(life_adaclevel) > 0) then
		{
			life_atmcash = 5000; //Starting Bank Money
		} else {
			life_atmcash = 2500; //Starting Bank Money
		};
		life_paycheck = 200; //Paycheck Amount
	}
};

/*
*********************************************
****** Custom Variables - FAER System *******
*********************************************
*/
speeding_points = 0;

/*
*****************************************************
****** Custom Variables - Altis Racing System *******
*****************************************************
*/

racing_rounds = 0;
race_started = false;
race_competitors = [];
round_starttime = 0;

/*
*****************************************************
****** Custom Variables - Factorio *******
*****************************************************
*/

factorio_inv = [];

//initialize factorio inv item variables

factorio_inv_items = 
[
	//vehicle parts
	"factorio_inv_tyre",
	"factorio_inv_body",
	"factorio_inv_seats",
	"factorio_inv_cable",
	"factorio_inv_glass",
	"factorio_inv_oilp"
];

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	//Essen
	"life_inv_apple",
	"life_inv_peach",
	"life_inv_donuts",
	"life_inv_goldendonat",
	"life_inv_rabbit",
	"life_inv_tbacon",
	"life_inv_frogeat",
	"life_inv_mackerel",
	"life_inv_ornate",
	"life_inv_salema",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_honeyu",
	"life_inv_honeyp",
	"life_inv_cheeses",
	"life_inv_cheesep",
	"life_inv_buns",
	"life_inv_bunp",
	"life_inv_cheesesticks",
	"life_inv_cheesestickp",
	"life_inv_pear",
	"life_inv_sausage",
	"life_inv_jailmeal",
	
	//trinken
	"life_inv_water",
	"life_inv_coffee",
	"life_inv_redgull",
	"life_inv_beer",
	"life_inv_applewine",
	"life_inv_wodka",
	"life_inv_proteinshake",
	"life_inv_milku",
	"life_inv_milkp",
	"life_inv_milks",
	"life_inv_peachbooze",
	"life_inv_pearbooze",
	"life_inv_grape",
	"life_inv_wine",

	//legal
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_copperore",
	"life_inv_copperr",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_silverore",
	"life_inv_silverbar",
	"life_inv_goldore",
	"life_inv_goldbar",
	"life_inv_diamond",
	"life_inv_diamondr",
	"life_inv_sand",
	"life_inv_glass",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_woodu",
	"life_inv_woodp",
	"life_inv_cereals",
	"life_inv_frog",
	"life_inv_eyedrops",
	"life_inv_pseudo",
	"life_inv_herps",
	"life_inv_herpp",
	"life_inv_eggs",
	"life_inv_eggp",
	"life_inv_butters",
	"life_inv_butterp",
	"life_inv_flours",
	"life_inv_flourp",
	"life_inv_hops",
	"life_inv_malt",
	"life_inv_potato",
	"life_inv_tabaccou",
	"life_inv_tabaccop",
	"life_inv_tabaccos",
	"life_inv_cigar",
	"life_inv_caoutchouc",
	"life_inv_rubber",
	"life_inv_tyre",
	"life_inv_cable",
	"life_inv_metalparts",
	"life_inv_body",
	"life_inv_beef",
	"life_inv_cowskin",
	"life_inv_leather",
	"life_inv_seats",
	"life_inv_antiques",
	"life_inv_trinket",
	"life_inv_medmarijuana",

	//illegal
	"life_inv_turtle",
	"life_inv_turtlesoup",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_cokeps",
	"life_inv_marijuana",
	"life_inv_cannabis",
	"life_inv_froglsd",
	"life_inv_croco",
	"life_inv_methp",
	"life_inv_methu",

	//sonstiges
	"life_inv_fishingpoles",
	"life_inv_lockpick",
	"life_inv_pickaxe",
	"life_inv_spikeStrip",
	"life_inv_fuelE",
	"life_inv_fuelF",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_ziptie",
	"life_inv_goldbank",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	//Führerscheine Zivis
	["license_civ_driver","civ"],
	["license_civ_truck","civ"],
	["license_civ_air","civ"],
	["license_civ_boat","civ"],

	//Führerscheine und Lizenzen Polizei
	["license_cop_air","cop"],
	["license_cop_cg","cop"],
	["license_cop_swat","cop"],

	//Führerscheine und Lizenzen Ärzte
	["license_med_air","med"],

	//Führerscheine und Lizenzen Ärzte
	["license_adac_truck","adac"],
	["license_adac_air","adac"],

	//Lizenzen legal
	["license_civ_oil","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_gold","civ"],
	["license_civ_silver","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_wood","civ"],
	["license_civ_frogeat","civ"],
	["license_civ_medmarijuana","civ"],
	["license_civ_honey","civ"],
	["license_civ_milk","civ"],
	["license_civ_flour","civ"],
	["license_civ_beer","civ"],
	["license_civ_wodka","civ"],
	["license_civ_peachbooze","civ"],
	["license_civ_pearbooze","civ"],
	["license_civ_applewine","civ"],
	["license_civ_wine","civ"],
	["license_civ_tabacco","civ"],
	["license_civ_rubber","civ"],
	["license_civ_tyre","civ"],
	["license_civ_body","civ"],
	["license_civ_leather","civ"],
	["license_civ_seats","civ"],
	["license_civ_trinket","civ"],
	["license_civ_cheese","civ"],
	["license_civ_butter","civ"],
	["license_civ_cigar","civ"],
	["license_civ_cable","civ"],
	["license_civ_butcher","civ"],
	["license_civ_baker","civ"],
	["license_civ_factorio","civ"],

	//Lizenzen illegal
	["license_civ_heroin","civ"],
	["license_civ_coke","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_froglsd","civ"],
	["license_civ_croco","civ"],
	["license_civ_meth","civ"],

	//Lizenzen sonstiges
	["license_civ_home","civ"],
	["license_civ_rebel","civ"],
	["license_civ_gang","civ"],
	["license_civ_gun","civ"],
	["license_civ_dive","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",39],["heroinp",78],["cocaine",42],["cocainep",84],["cocaineps",114],["marijuana",72],["turtle",366],["froglsd",78],["methp",84],["methu",42],["croco",96],["turtlesoup",75]];

/*
	Sell / buy arrays
*/
sell_array = 
[
	//essen
	["apple",6],
	["peach",7],
	["donuts",15],
	["goldendonat",75],
	["rabbit",10],
	["tbacon",15],
	["frogeat",36],
	["mackerel",20],
	["ornate",5],
	["salema",10],
	["tuna",40],
	["mullet",15],
	["catshark",60],
	["honeyp",29],
	["cheesep",11],
	["butterp",7],
	["flourp",23],
	["buns",9],
	["bunp",10],
	["cheesesticks",9],
	["cheesestickp",10],
	["sausage",4],
	
	//trinken
	["water",5],
	["coffee",5],
	["redgull",200],
	["beer",36],
	["applewine",29],
	["wodka",31],
	["proteinshake",75],
	["peachbooze",30],
	["pearbooze",38],
	["milkp",30],
	["wine",31],
	["pear",13],
	["grape",15],

	//legal
	["oilp",90],
	["copper_r",54],
	["iron_r",60],
	["silverbar",72],
	["goldbar",78],
	["diamondr",84],
	["glass",66],
	["salt_r",72],
	["cement",60],
	["woodp",72],
	["eyedrops",5],
	["pseudo",10],
	["herpp",16],
	["eggp",14],
	["flourp",29],
	["tabaccop",48],
	["cigar",4],
	["rubber",38],
	["tyre",69],
	["cable",140],
	["body",144],
	["leather",60],
	["seats",114],
	["antiques",36],
	["trinket",1950],
	["medmarijuana",48],

	//illegal
	["turtle",366],
	["turtlesoup",75],
	["heroinu",30],
	["heroinp",78],
	["cocainep",84],
	["cocaineps",114],
	["marijuana",72],
	["froglsd",78],
	["croco",96],
	["methp",84],

	//sonstiges
	["fishing",75],
	["lockpick",125],
	["pickaxe",125],
	["spikeStrip",25],
	["ziptie",50],
	["fuelE",50],
	["fuelF",50],
	["storagesmall",10938],
	["storagebig",21875],
	["blastingcharge",6500],
	["boltcutter",3250],
	["defusekit",1750]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	//essen
	["apple",10],
	["peach",10],
	["donuts",30],
	["goldendonat",150],
	["rabbit",20],
	["tbacon",30],
	["frogeat",60],
	["mackerel",40],
	["ornate",10],
	["salema",20],
	["tuna",80],
	["mullet",30],
	["catshark",120],
	["herps",0],
	["cheeses",0],
	["butters",0],
	["bunp",15],
	["cheesestickp",20],
	["sausage",25],
	["cheesep",25],
	["jailmeal",0],
	["honeyp",48],
	["pear",26],
	["grape",30],

	//trinken
	["water",10],
	["coffee",10],
	["redgull",100],
	["beer",60],
	["applewine",48],
	["wodka",52],
	["proteinshake",150],
	["peachbooze",48],
	["pearbooze",52],
	["milks",0],
	["wine",90],

	//legal
	["eyedrops",10],
	["pseudo",20],
	["herps",0],
	["eggs",0],
	["flours",0],
    ["tabaccos",0],
    ["tabaccor",0],
	["cigar",22],
	["beef",0],
	["cowskin",10],
	["medmarijuana",140],

	//illegal
	["turtlesoup",150],
	["heroinp",80],
	["cocainep",85],
	["marijuana",75],
	["froglsd",80],
	["croco",100],
	["methp",95],

	//sonstiges
	["fishing",150],
	["lockpick",250],
	["pickaxe",250],
	["ziptie",1000],
	["fuelE",55],
	["fuelF",100],
	["spikeStrip",50],
	["storagesmall",21876],
	["storagebig",43750],
	["blastingcharge",13000],
	["boltcutter",7500],
	["defusekit",3500]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["Binocular",50],
	["ItemGPS",50],
	["ToolKit",125],
	["FirstAidKit",250],
	["Medikit",125],
	["NVGoggles",500],
	["hgun_Rook40_F",500],
	["16Rnd_9x21_Mag",20],
	["hgun_Pistol_heavy_02_F",1000],
	["6Rnd_45ACP_Cylinder",40],
	["hgun_ACPC2_F",100],
	["9Rnd_45ACP_Mag",60],
	["hgun_PDW2000_F",1500],
	["30Rnd_9x21_Mag",60],
	["optic_ACO_grn_smg",700],
	["arifle_SDAR_F",300],
	["20Rnd_556x45_UW_mag",15],
	["arifle_TRG20_F",6000],
	["30Rnd_556x45_Stanag",30],
	["arifle_Katiba_F",9000],
	["30Rnd_65x39_caseless_mag",45],
	["srifle_DMR_01_F",15000],
	["10Rnd_762x51_Mag",75],
	["optic_ACO_grn",700],
	["optic_Holosight",800],
	["optic_Hamr",1300],
	["hgun_P07_snds_F",100],
	["hgun_P07_F",100],
	["SMG_02_F",300],
	["arifle_MX_F",nil,2000],
	["acc_flashlight",100],
	["optic_Aco_smg",200],
	["optic_Arco",300],
	["MineDetector",200],
	["arifle_MXC_F",2000],
	["arifle_MXM_F",2500],
	["srifle_EBR_F",3000],
	["20Rnd_762x51_Mag",150],
	["LMG_Mk200_F",4000],
	["200Rnd_65x39_cased_Box",200],
	["srifle_LRR_F",24000],
	["7Rnd_408_Mag",350],
	["srifle_GM6_F",10000],
	["5Rnd_127x108_Mag",500],
	["optic_MRCO",600],
	["optic_SOS",2000],
	["optic_tws",2500],
	["optic_tws_mg",3000],
	["muzzle_snds_acp",550],
	["muzzle_snds_L",690],
	["muzzle_snds_H",910],
	["muzzle_snds_H_MG",1110],
	["muzzle_snds_B",1310],
	["Rangefinder",nil,1000]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

// Neu Zivilisten Garage-Ausparkpreise
life_garage_prices_civ =
[
	["B_Quadbike_01_F",9],
	["C_Hatchback_01_F",39],
	["C_Hatchback_01_sport_F",68],
	["C_Offroad_01_F",90],
	["C_SUV_01_F",135],
	["C_Van_01_transport_F",203],
	["C_Van_01_box_F",225],
	["C_Van_01_fuel_F",281],
	["I_Truck_02_transport_F",510],
	["I_Truck_02_covered_F",312],
	["I_Truck_02_box_F",765],
	["O_Truck_02_fuel_F",1020],
	["B_Truck_01_mover_F",1350],
	["O_Truck_03_device_F",3840],
	["O_Truck_03_transport_F",1995],
	["O_Truck_03_ammo_F",2280],
	["O_Truck_03_covered_F",2700],
	["O_Truck_03_repair_F",3465],
	["O_Truck_03_fuel_F",3938],
	["B_Truck_01_transport_F",6000],
	["B_Truck_01_ammo_F",6563],
	["B_Truck_01_covered_F",7688],
	["B_Truck_01_box_F",9188],
	["B_Truck_01_fuel_F",9938],
	["B_Heli_Light_01_F",1650],
	["O_Heli_Light_02_unarmed_F",3548],
	["I_Heli_Transport_02_F",5520],
	["I_MRAP_03_F",7296],
	["C_Rubberboat",191],
	["C_Boat_Civil_01_F",439],
	["B_G_Offroad_01_F",105],
	["O_MRAP_02_F",7500],
	["B_G_Offroad_01_armed_F",5400]
];
__CONST__(life_garage_prices_civ,life_garage_prices_civ);

// Neu Zivilisten Garage-Verkaufpreise
life_garage_sell_civ =
[
	["B_Quadbike_01_F",180],
	["C_Hatchback_01_F",750],
	["C_Hatchback_01_sport_F",1350],
	["C_Offroad_01_F",1800],
	["C_SUV_01_F",2700],
	["C_Van_01_transport_F",4050],
	["C_Van_01_box_F",4500],
	["C_Van_01_fuel_F",5625],
	["I_Truck_02_transport_F",10200],
	["I_Truck_02_covered_F",12240],
	["I_Truck_02_box_F",15300],
	["O_Truck_02_fuel_F",20400],
	["B_Truck_01_mover_F",27000],
	["O_Truck_03_device_F",76800],
	["O_Truck_03_transport_F",39900],
	["O_Truck_03_ammo_F",45600],
	["O_Truck_03_covered_F",54000],
	["O_Truck_03_repair_F",69300],
	["O_Truck_03_fuel_F",78750],
	["B_Truck_01_transport_F",120000],
	["B_Truck_01_ammo_F",131250],
	["B_Truck_01_covered_F",153750],
	["B_Truck_01_box_F",183750],
	["B_Truck_01_fuel_F",198750],
	["B_Heli_Light_01_F",33000],
	["O_Heli_Light_02_unarmed_F",70950],
	["I_Heli_Transport_02_F",110400],
	["I_MRAP_03_F",145920],
	["C_Rubberboat",3825],
	["C_Boat_Civil_01_F",8775],
	["B_G_Offroad_01_F",2100],
	["O_MRAP_02_F",150000],
	["B_G_Offroad_01_armed_F",108000]
];
__CONST__(life_garage_sell_civ,life_garage_sell_civ);

// Neu Cop Garage-Ausparkpreise
life_garage_prices_cop =
[
	["C_SUV_01_F",27],
	["C_Offroad_01_F",18],
	["B_MRAP_01_F",300],
	["I_MRAP_03_F",450],
	["B_MRAP_01_hmg_F",675],
	["B_Heli_Light_01_F",330],
	["I_Heli_light_03_unarmed_F",507],
	["O_Heli_Light_02_unarmed_F",450],
	["B_Heli_Transport_01_F",1183],
	["B_Boat_Transport_01_F",38],
	["C_Boat_Civil_01_police_F",88],
	["B_Boat_Armed_01_minigun_F",293],
	["B_SDV_01_F",366]
];
__CONST__(life_garage_prices_cop,life_garage_prices_cop);

// Neu Cop Garage-Verkaufpreise
life_garage_sell_cop =
[
	["C_SUV_01_F",540],
	["C_Offroad_01_F",360],
	["B_MRAP_01_F",6000],
	["I_MRAP_03_F",9000],
	["B_MRAP_01_hmg_F",13500],
	["B_Heli_Light_01_F",6600],
	["I_Heli_light_03_unarmed_F",10136],
	["O_Heli_Light_02_unarmed_F",11000],
	["B_Heli_Transport_01_F",23650],
	["B_Boat_Transport_01_F",765],
	["C_Boat_Civil_01_police_F",1755],
	["B_Boat_Armed_01_minigun_F",5850],
	["B_SDV_01_F",7313]
];
__CONST__(life_garage_sell_cop,life_garage_sell_cop);

// Neu Medic Garage-Ausparkpreise
life_garage_prices_med =
[
	["C_Offroad_01_F",60],
	["C_SUV_01_F",90],
	["B_Heli_Light_01_F",825]
	
];
__CONST__(life_garage_prices_med,life_garage_prices_med);

// Neu Medic Garage-Verkaufpreise
life_garage_sell_med =
[
	["C_Offroad_01_F",600],
	["C_SUV_01_F",900],
	["B_Heli_Light_01_F",8250]
];
__CONST__(life_garage_sell_med,life_garage_sell_med);

// Neu Adac Garage-Ausparkpreise
life_garage_prices_adac =
[
	["C_Offroad_01_F",60],
	["I_Truck_02_box_F",900]
];
__CONST__(life_garage_prices_adac,life_garage_prices_adac);

// Neu Adac Garage-Verkaufpreise
life_garage_sell_adac =
[
	["C_Offroad_01_F",600],
	["I_Truck_02_box_F",9000],
	["B_Heli_Light_01_F",8250]
];
__CONST__(life_garage_sell_adac,life_garage_sell_adac);

//Neu Verkaufspreise für den ChopShop
life_chop_sell =
[
	["B_QuadBike_01_F",135],
	["C_Hatchback_01_F",585],
	["C_Hatchback_01_sport_F",1013],
	["C_SUV_01_F",2025],
	["C_Offroad_01_F",1350],
	["C_Van_01_transport_F",3038],
	["C_Van_01_box_F",3375],
	["C_Van_01_fuel_F",4219],
	["I_Truck_02_transport_F",7650],
	["I_Truck_02_covered_F",9180],
	["I_Truck_02_box_F",11475],
	["O_Truck_02_fuel_F",15300],
	["B_Truck_01_mover_F",20250],
	["O_Truck_03_device_F",57600],
	["O_Truck_03_transport_F",29925],
	["O_Truck_03_ammo_F",34200],
	["O_Truck_03_covered_F",40500],
	["O_Truck_03_repair_F",51975],
	["O_Truck_03_fuel_F",59063],
	["B_Truck_01_transport_F",90000],
	["B_Truck_01_ammo_F",98438],
	["B_Truck_01_covered_F",115313],
	["B_Truck_01_box_F",137813],
	["B_Truck_01_fuel_F",149063],
	["B_Heli_Light_01_F",24750],
	["O_Heli_Light_02_unarmed_F",53213],
	["I_Heli_Transport_02_F",82800],
	["I_MRAP_03_F",109440],
	["B_G_Offroad_01_F",1575],
	["B_G_Offroad_01_armed_F",81000],
	["O_MRAP_02_F",112500],
	["B_MRAP_01_F",4500],
	["B_MRAP_01_hmg_F",10125]
];
__CONST__(life_chop_sell,life_chop_sell);

//Neu Verkaufspreise für den ChopShop
life_backpack_carryWeights =
[
	// Civ Backpacks from small to big
	["B_AssaultPack_rgr",10],
    ["B_AssaultPack_cbr",10],
    ["B_AssaultPack_sgg",10],
    ["B_AssaultPack_blk",10],
    ["B_AssaultPack_cbr",10],
    ["B_FieldPack_khk",20],
    ["B_FieldPack_cbr",20],
    ["B_FieldPack_blk",20],
    ["B_Kitbag_rgr",30],
    ["B_Kitbag_sgg",30],
    ["B_Kitbag_cbr",30],
    ["B_Bergen_sgg",40],
    ["B_Bergen_rgr",40],
    ["B_TacticalPack_oli",40],
    ["B_Bergen_blk",40],
    ["B_Carryall_oli",70],
    ["B_Carryall_khk",70],
	
	// Reb Backpacks from small to big
	["B_AssaultPack_dgtl",10],
    ["B_AssaultPack_mcamo",10],
    ["B_FieldPack_ocamo",20],
    ["B_FieldPack_oucamo",20],
    ["B_Kitbag_mcamo",30],
    ["B_TacticalPack_mcamo",40],
    ["B_TacticalPack_ocamo",40],
    ["B_Bergen_mcamo",70],
    ["B_Carryall_ocamo",70],
    ["B_Carryall_oucamo",70],
    ["B_Carryall_mcamo",70]
];
__CONST__(life_backpack_carryWeights,life_backpack_carryWeights);
