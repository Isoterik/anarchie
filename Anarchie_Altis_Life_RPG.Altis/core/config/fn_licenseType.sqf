/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			//Führerscheine Zivis
			case "driver": {_var = "license_civ_driver"}; //Fuehrerschein
			case "truck":{_var = "license_civ_truck"}; //LKW-Fuehrerschein
			case "pilot": {_var = "license_civ_air"}; //Flugschein
			case "boat": {_var = "license_civ_boat"}; //Bootsschein

			//Führerscheine und Lizenzen Polizei
			case "cair": {_var = "license_cop_air"}; //Fluglizenz Polizei
			case "cg": {_var = "license_cop_cg"}; //Bootsschein Polizei
			case "swat": {_var = "license_cop_swat"}; //SEK-Lizenz

			//Führerscheine und Lizenzen Ärzte
			case "mair": {_var = "license_med_air"}; //Fluglizenz Arzt

			//Führerscheine und Lizenzen ADAC
			case "adactruck": {_var = "license_adac_truck"}; //ADAC LKW-Fuehrerschein
			case "adacair": {_var = "license_adac_air"}; //ADAC Fluglizenz

			//Lizenzen legal
			case "oil": {_var = "license_civ_oil"}; //Oelverarbeitung
			case "diamond": {_var = "license_civ_diamond"}; //Diamantenverarbeitung
			case "copper": {_var = "license_civ_copper"}; //Kupferverarbeitung
			case "iron": {_var = "license_civ_iron"}; //Eisenverarbeitung
			case "gold": {_var = "license_civ_gold"}; //Goldverarbeitung
			case "silver": {_var = "license_civ_silver"}; //Silberverarbeitung
			case "sand": {_var = "license_civ_sand"}; //Sandverarbeitung
			case "salt": {_var = "license_civ_salt"}; //Salzverarbeitung
			case "cement": {_var = "license_civ_cement"}; //Zementverarbeitung
			case "wood": {_var = "license_civ_wood"}; //Forstschein
			case "frogeat": {_var = "license_civ_frogeat"}; //Froschverarbeitung
			case "medmarijuana": {_var = "license_civ_medmarijuana"}; //Medi-Marijuhanaverarbeitung
			case "honey": {_var = "license_civ_honey"}; //Honigverarbeitung
			case "milk": {_var = "license_civ_milk"}; //Milchverarbeitung
			case "flour": {_var = "license_civ_flour"}; //Getreideverarbeitung
			case "beer": {_var = "license_civ_beer"}; //Bierlizenz
			case "wodka": {_var = "license_civ_wodka"}; //Wodkalizenz
			case "peachbooze": {_var = "license_civ_peachbooze"}; //Pfirsichschnapslizenz
			case "pearbooze": {_var = "license_civ_pearbooze"}; //Birnenschnapslizenz
			case "pearbooze": {_var = "license_civ_pearbooze"}; //Birnenschnapslizenz
			case "applewine": {_var = "license_civ_applewine"}; //Apfelmostlizenz
			case "wine": {_var = "license_civ_wine"}; //Weinlizenz
			case "tabacco": {_var = "license_civ_tabacco"}; //Tabaklizenz
			case "rubber": {_var = "license_civ_rubber"}; //Gummilizenz
			case "tyre": {_var = "license_civ_tyre"}; //Reifenlizenz
			case "cable": {_var = "license_civ_cable"}; //Kabellizenz
			case "body": {_var = "license_civ_body"}; //Karosserielizenz
			case "leather": {_var = "license_civ_leather"}; //Lederlizenz
			case "seats": {_var = "license_civ_seats"}; //Polstererlizenz
			case "trinket": {_var = "license_civ_trinket"}; //Juwelierlizenz
			case "cheese": {_var = "license_civ_cheese"}; //Käselizenz
			case "butter": {_var = "license_civ_butter"}; //Butterlizenz
			case "cigar": {_var = "license_civ_cigar"}; //Zigarrenlizenz
			case "butcher": {_var = "license_civ_butcher"}; //Metzgerlizenz
			case "baker": {_var = "license_civ_baker"}; //Bäckerlizenz
			case "factorio": {_var = "license_civ_factorio"}; //Factoriolizenz

			//Lizenzen illegal
			case "heroin": {_var = "license_civ_heroin"}; //Heroinverarbeitung
			case "cocaine": {_var = "license_civ_coke"}; //Kokainverarbeitung
			case "marijuana": {_var = "license_civ_marijuana"}; //Marijuhanaverarbeitung
			case "froglsd": {_var = "license_civ_froglsd"}; //LSD-Verarbeitung
			case "croco": {_var = "license_civ_croco"}; //Crocodileverarbeitung
			case "meth": {_var = "license_civ_meth"}; //Methverarbeitung

			//Lizenzen sonstiges
			case "home": {_var = "license_civ_home"}; //Einwohnermeldeschein
			case "rebel": {_var = "license_civ_rebel"}; //Rebellen-Ausbildung
			case "gang": {_var = "license_civ_gang"}; //Gang-Lizenz
			case "gun": {_var = "license_civ_gun"}; //Waffenschein
			case "dive": {_var = "license_civ_dive"}; //Tauchschein
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			//Führerscheine Zivis
			case "license_civ_driver": {_var = "driver"}; //Fuehrerschein
			case "license_civ_truck":{_var = "truck"}; //LKW-Fuehrerschein
			case "license_civ_air": {_var = "pilot"}; //Flugschein
			case "license_civ_boat": {_var = "boat"}; //Bootsschein

			//Führerscheine und Lizenzen Polizei
			case "license_cop_air": {_var = "cair"}; //Fluglizenz Polizei
			case "license_cop_cg": {_var = "cg"}; //Bootsschein Polizei
			case "license_cop_swat": {_var = "swat"}; //SEK-Lizenz

			//Führerscheine und Lizenzen Ärzte
			case "license_med_air": {_var = "mair"}; //Fluglizenz Arzt

			//Führerscheine und Lizenzen ADAC
			case "license_adac_truck": {_var = "adactruck"}; //ADAC LKW-Fuehrerschein
			case "license_adac_air": {_var = "adacair"}; //ADAC Fluglizenz

			//Lizenzen legal
			case "license_civ_oil": {_var = "oil"}; //Oelverarbeitung
			case "license_civ_diamond": {_var = "diamond"}; //Diamantenverarbeitung
			case "license_civ_copper": {_var = "copper"}; //Kupferverarbeitung
			case "license_civ_iron": {_var = "iron"}; //Eisenverarbeitung
			case "license_civ_gold": {_var = "gold"}; //Goldverarbeitung
			case "license_civ_silver": {_var = "silver"}; //Silberverarbeitung
			case "license_civ_sand": {_var = "sand"}; //Sandverarbeitung
			case "license_civ_salt": {_var = "salt"}; //Salzverarbeitung
			case "license_civ_cement": {_var = "cement"}; //Zementverarbeitung
			case "license_civ_wood": {_var = "wood"}; //Forstschein
			case "license_civ_frogeat": {_var = "frogeat"}; //Froschverarbeitung
			case "license_civ_medmarijuana": {_var = "medmarijuana"}; //Medi-Marijuhanaverarbeitung
			case "license_civ_honey": {_var = "honey"}; //Honigverarbeitung
			case "license_civ_milk": {_var = "milk"}; //Milchverarbeitung
			case "license_civ_flour": {_var = "flour"}; //Getreideverarbeitung
			case "license_civ_beer": {_var = "beer"}; //Bierlizenz
			case "license_civ_wodka": {_var = "wodka"}; //Wodkalizenz
			case "license_civ_peachbooze": {_var = "peachbooze"}; //Pfirsichschnapslizenz
			case "license_civ_pearbooze": {_var = "pearbooze"}; //Birnenschnapslizenz
			case "license_civ_applewine": {_var = "applewine"}; //Apfelmostlizenz
			case "license_civ_wine": {_var = "wine"}; //Weinlizenz
			case "license_civ_tabacco": {_var = "tabacco"}; //Tabaklizenz
			case "license_civ_rubber": {_var = "rubber"}; //Gummilizenz
			case "license_civ_tyre": {_var = "tyre"}; //Reifenlizenz
			case "license_civ_cable": {_var = "cable"}; //Kbellizenz
			case "license_civ_body": {_var = "body"}; //Karosserielizenz
			case "license_civ_leather": {_var = "leather"}; //Lederlizenz
			case "license_civ_seats": {_var = "seats"}; //Plostererlizenz
			case "license_civ_trinket": {_var = "trinket"}; //Juwelierlizenz
			case "license_civ_cheese": {_var = "cheese"}; //Käselizenz
			case "license_civ_butter": {_var = "butter"}; //Butterlizenz
			case "license_civ_cigar": {_var = "cigar"}; //Zigarrenlizenz
			case "license_civ_butcher": {_var = "butcher"}; //Metzgerlizenz
			case "license_civ_baker": {_var = "baker"}; //Bäckerlizenz
			case "license_civ_factorio": {_var = "factorio"}; //Factoriolizenz

			//Lizenzen illegal
			case "license_civ_heroin": {_var = "heroin"}; //Heroinverarbeitung
			case "license_civ_coke": {_var = "cocaine"}; //Kokainverarbeitung
			case "license_civ_marijuana": {_var = "marijuana"}; //Marijuhanaverarbeitung
			case "license_civ_froglsd": {_var = "froglsd"}; //LSD-Verarbeitung
			case "license_civ_croco": {_var = "croco"}; //Crocodileverarbeitung
			case "license_civ_meth": {_var = "meth"}; //Methverarbeitung

			//Lizenzen sonstiges
			case "license_civ_home": {_var = "home"}; //Einwohnermeldeschein
			case "license_civ_rebel": {_var = "rebel"}; //Rebellen-Ausbildung
			case "license_civ_gang": {_var = "gang"}; //Gang-Lizenz
			case "license_civ_gun": {_var = "gun"}; //Waffenschein
			case "license_civ_dive": {_var = "dive"}; //Tauchschein
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;
