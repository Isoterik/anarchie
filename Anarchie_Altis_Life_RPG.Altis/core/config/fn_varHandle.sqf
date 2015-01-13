/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			//essen
			case "apple": {"life_inv_apple"};
			case "peach": {"life_inv_peach"};
			case "donuts": {"life_inv_donuts"};
			case "goldendonat": {"life_inv_goldendonat"};
			case "rabbit": {"life_inv_rabbit"};
			case "tbacon": {"life_inv_tbacon"};
			case "frogeat": {"life_inv_frogeat"};
			case "mackerel": {"life_inv_mackerel"};
			case "ornate": {"life_inv_ornate"};
			case "salema": {"life_inv_salema"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "honeyu": {"life_inv_honeyu"};
			case "honeyp": {"life_inv_honeyp"};
			case "cheeses": {"life_inv_cheeses"};
			case "cheesep": {"life_inv_cheesep"};
			case "cheesesticks": {"life_inv_cheesesticks"};
			case "cheesestickp": {"life_inv_cheesestickp"};
			case "pear": {"life_inv_pear"};
			case "sausage": {"life_inv_sausage"};
			case "jailmeal": {"life_inv_jailmeal"};

			//trinken
			case "water": {"life_inv_water"};
			case "coffee": {"life_inv_coffee"};
			case "redgull": {"life_inv_redgull"};
			case "beer": {"life_inv_beer"};
			case "applewine": {"life_inv_applewine"};
			case "wodka": {"life_inv_wodka"};
			case "proteinshake": {"life_inv_proteinshake"};
			case "milku": {"life_inv_milku"};
			case "milkp": {"life_inv_milkp"};
			case "milks": {"life_inv_milks"};
			case "peachbooze": {"life_inv_peachbooze"};
			case "pearbooze": {"life_inv_pearbooze"};
			case "grape": {"life_inv_grape"};
			case "wine": {"life_inv_wine"};

			//legal
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "copperore": {"life_inv_copperore"};
			case "copper_r": {"life_inv_copperr"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "silverore": {"life_inv_silverore"};
			case "silverbar": {"life_inv_silverbar"};
			case "goldore": {"life_inv_goldore"};
			case "goldbar": {"life_inv_goldbar"};
			case "diamond": {"life_inv_diamond"};
			case "diamondr": {"life_inv_diamondr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "rock": {"life_inv_rock"};
			case "cement": {"life_inv_cement"};
			case "woodu": {"life_inv_woodu"};
			case "woodp": {"life_inv_woodp"};
			case "cereals": {"life_inv_cereals"};
			case "frog": {"life_inv_frog"};
			case "eyedrops": {"life_inv_eyedrops"};
			case "pseudo": {"life_inv_pseudo"};
			case "herps": {"life_inv_herps"};
			case "herpp": {"life_inv_herpp"};
			case "eggs": {"life_inv_eggs"};
			case "eggp": {"life_inv_eggp"};
			case "butters": {"life_inv_butters"};
			case "butterp": {"life_inv_butterp"};
			case "flours": {"life_inv_flours"};
			case "flourp": {"life_inv_flourp"};
			case "buns": {"life_inv_buns"};
			case "bunp": {"life_inv_bunp"};
			case "hops": {"life_inv_hops"};
			case "malt": {"life_inv_malt"};
			case "potato": {"life_inv_potato"};
			case "tabaccou": {"life_inv_tabaccou"};
			case "tabaccop": {"life_inv_tabaccop"};
			case "tabaccos": {"life_inv_tabaccos"};
			case "cigar": {"life_inv_cigar"};
			case "caoutchouc": {"life_inv_caoutchouc"};
			case "rubber": {"life_inv_rubber"};
			case "tyre": {"life_inv_tyre"};
			case "cable": {"life_inv_cable"};
			case "metalparts": {"life_inv_metalparts"};
			case "body": {"life_inv_body"};
			case "beef": {"life_inv_beef"};
			case "cowskin": {"life_inv_cowskin"};
			case "leather": {"life_inv_leather"};
			case "seats": {"life_inv_seats"};
			case "antiques": {"life_inv_antiques"};
			case "trinket": {"life_inv_trinket"};
			case "medmarijuana": {"life_inv_medmarijuana"};

			//illegal
			case "turtle": {"life_inv_turtle"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "cocaineps": {"life_inv_cokeps"};
			case "marijuana": {"life_inv_marijuana"};
			case "cannabis": {"life_inv_cannabis"};
			case "froglsd": {"life_inv_froglsd"};
			case "croco": {"life_inv_croco"};
			case "methp": {"life_inv_methp"};
			case "methu": {"life_inv_methu"};

			//sonstiges
			case "fishing": {"life_inv_fishingpoles"};
			case "lockpick": {"life_inv_lockpick"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "money": {"life_cash"};
			case "ziptie": {"life_inv_ziptie"};
			case "goldbank": {"life_inv_goldbank"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};

			//factorio
			case "ftyre": {"factorio_inv_tyre"};
			case "fbody": {"factorio_inv_body"};
			case "fseats": {"factorio_inv_seats"};
			case "fcable": {"factorio_inv_cable"};
			case "fglass": {"factorio_inv_glass"};
			case "foilp": {"factorio_inv_oilp"};				
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			//essen
			case "life_inv_apple": {"apple"};
			case "life_inv_peach": {"peach"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_goldendonat": {"goldendonat"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_frogeat": {"frogeat"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_salema": {"salema"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_honeyu": {"honeyu"};
			case "life_inv_honeyp": {"honeyp"};
			case "life_inv_milku": {"milku"};
			case "life_inv_milkp": {"milkp"};
			case "life_inv_milks": {"milks"};
			case "life_inv_cheeses": {"cheeses"};
			case "life_inv_cheesep": {"cheesep"};
			case "life_inv_butters": {"butters"};
			case "life_inv_butterp": {"butterp"};
			case "life_inv_buns": {"buns"};
			case "life_inv_bunp": {"bunp"};
			case "life_inv_cheesesticks": {"cheesesticks"};
			case "life_inv_cheesestickp": {"cheesestickp"};
			case "life_inv_pear": {"pear"};
			case "life_inv_sausage": {"sausage"};
			case "life_inv_jailmeal": {"jailmeal"};

			//trinken
			case "life_inv_water": {"water"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_beer": {"beer"};
			case "life_inv_applewine": {"applewine"};
			case "life_inv_wodka": {"wodka"};
			case "life_inv_proteinshake": {"proteinshake"};
			case "life_inv_peachbooze": {"peachbooze"};
			case "life_inv_pearbooze": {"pearbooze"};
			case "life_inv_grape": {"grape"};
			case "life_inv_wine": {"wine"};

			//legal
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_silverore": {"silverore"};
			case "life_inv_silverbar": {"silverbar"};
			case "life_inv_goldore": {"goldore"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondr"};
			case "life_inv_sand": {"sand"};
			case "life_inv_glass": {"glass"};
			case "life_inv_salt": {"salt"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_rock": {"rock"};
			case "life_inv_cement": {"cement"};
			case "life_inv_woodu": {"woodu"};
			case "life_inv_woodp": {"woodp"};
			case "life_inv_cereals": {"cereals"};
			case "life_inv_frog": {"frog"};
			case "life_inv_eyedrops": {"eyedrops"};
			case "life_inv_pseudo": {"pseudo"};
			case "life_inv_herps": {"herps"};
			case "life_inv_herpp": {"herpp"};
			case "life_inv_eggs": {"eggs"};
			case "life_inv_eggp": {"eggp"};
			case "life_inv_flours": {"flours"};
			case "life_inv_flourp": {"flourp"};
			case "life_inv_hops": {"hops"};
			case "life_inv_malt": {"malt"};
			case "life_inv_potato": {"potato"};
			case "life_inv_tabaccou": {"tabaccou"};
			case "life_inv_tabaccop": {"tabaccop"};
			case "life_inv_tabaccos": {"tabaccos"};
			case "life_inv_cigar": {"cigar"};
			case "life_inv_caoutchouc": {"caoutchouc"};
			case "life_inv_rubber": {"rubber"};
			case "life_inv_tyre": {"tyre"};
			case "life_inv_cable": {"cable"};
			case "life_inv_metalparts": {"metalparts"};
			case "life_inv_body": {"body"};
			case "life_inv_beef": {"beef"};
			case "life_inv_cowskin": {"cowskin"};
			case "life_inv_leather": {"leather"};
			case "life_inv_seats": {"seats"};
			case "life_inv_antiques": {"antiques"};
			case "life_inv_trinket": {"trinket"};
			case "life_inv_medmarijuana": {"medmarijuana"};

			//illegal
			case "life_inv_turtle": {"turtle"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};

			case "life_inv_cokeps": {"cocaineps"};

			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_froglsd": {"froglsd"};
			case "life_inv_croco": {"croco"};
			case "life_inv_methu": {"methu"};
			case "life_inv_methp": {"methp"};

			//sonstiges
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_cash": {"money"};
			case "life_inv_ziptie": {"ziptie"};	
			case "life_inv_goldbank": {"goldbank"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};

			//factorio
			case "factorio_inv_tyre": {"ftyre"};
			case "factorio_inv_body": {"fbody"};
			case "factorio_inv_seats": {"fseats"};
			case "factorio_inv_cable": {"fcable"};
			case "factorio_inv_glass": {"fglass"};
			case "factorio_inv_oilp": {"foilp"};
		};
	};
};
