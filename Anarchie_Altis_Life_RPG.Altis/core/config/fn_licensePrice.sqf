/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	//Führerscheine Zivis
	case "driver": {500}; //Fuehrerschein
	case "truck": {2500}; //LKW-Fuehrerschein
	case "pilot": {5000}; //Flugschein
	case "boat": {1000}; //Bootsschein

	//Führerscheine und Lizenzen Polizei
	case "cair": {2500}; //Fluglizenz Polizei
	case "cg": {100}; //Bootsschein Polizei
	case "swat": {100}; //SEK-Lizenz

	//Führerscheine und Lizenzen Ärzte
	case "mair": {2500}; //Fluglizenz Arzt

	//Führerscheine und Lizenzen ADAC
	case "adactruck": {1250}; //ADAC LKW-Fuehrerschein
	case "adacair": {2500}; //ADAC Fluglizenz 

	//Lizenzen legal
	case "oil": {11250}; //Oelverarbeitung
	case "diamond": {8400}; //Diamantenverarbeitung
	case "copper": {1000}; //Kupferverarbeitung
	case "iron": {1500}; //Eisenverarbeitung
	case "gold": {4875}; //Goldverarbeitung
	case "silver": {4500}; //Silberverarbeitung
	case "sand": {1650}; //Sandverarbeitung
	case "salt": {2500}; //Salzverarbeitung
	case "cement": {1500}; //Zementverarbeitung
	case "wood": {2500}; //Forstschein
	case "frogeat": {3000}; //Froschverarbeitung
	case "medmarijuana": {3000}; //Medi-Marijuhanaverarbeitung
	case "honey": {1500}; //Honigaverarbeitung
	case "milk": {1500}; //Honigaverarbeitung
	case "flour": {1500}; //Getreideverarbeitung
	case "beer": {3500}; //Bierllizenz
	case "wodka": {2000}; //Wodkalizenz
	case "peachbooze": {1500}; //Pfirsichschnapsllizenz
	case "pearbooze": {2000}; //Birnenschnapsllizenz
	case "applewine": {1500}; //Apfelmostlizenz
	case "wine": {2000}; //Weinlizenz
	case "tabacco": {2500}; //Tabaklizenz
	case "rubber": {7500}; //Gummilizenz
	case "tyre": {5000}; //Reifenlizenz
	case "cable": {7500}; //Kabellizenz
	case "leather": {1500};//Lederlizenz
	case "body": {7500}; //Karossierelizenz
	case "seats": {7500}; //Polstererlizenz
	case "trinket": {14000}; //Juwelierlizenz
	case "cheese": {6666}; //Käselizenz nicht käuflich muss aber da sein
	case "butter": {6666}; //Butterlizenz nicht käuflich muss aber da sein
	case "cigar": {6666}; //Zigarrenlizenz nicht käuflich muss aber da sein
	case "butcher": {6666}; //Metzgerlizenz nicht käuflich muss aber da sein
	case "baker": {6666}; //Metzgerlizenz nicht käuflich muss aber da sein
	case "factorio": {150000}; //Fabriklizenz
	
	//Lizenzen illegal
	case "heroin": {3750}; //Heroinverarbeitung
	case "cocaine": {4125}; //Kokainverarbeitung
	case "marijuana": {3000}; //Marijuhanaverarbeitung
	case "froglsd": {3375}; //LSD-Verarbeitung
	case "croco": {4875}; //Crocodileverarbeitung
	case "meth": {4875}; //Methverarbeitung

	//Lizenzen sonstiges
	case "home": {20000}; //Einwohnermeldeschein
	case "rebel": {25000}; //Rebellen-Ausbildung
	case "gang": {100000}; //Gang-Lizenz
	case "gun": {10000}; //Waffenschein
	case "dive": {1000}; //Tauchschein
};
