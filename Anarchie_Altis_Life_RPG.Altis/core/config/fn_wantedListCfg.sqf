/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_wantedListCfg.sqf
* moved tonics crime definition to the client. returns the crime information.
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0: STRING - crimeID - id of the crime which info will be returned
*
*/

private ["_crimeID","_type"];

_crimeID = [_this,0,"",[""]] call BIS_fnc_param;

//What is the crime?
switch(_crimeID) do
{
	case "100": {_type = ["Fahrlässige Tötung",10000]};
	case "102": {_type = ["Fahrlässige Tötung AMOK Personal",15000]};
	case "105": {_type = ["Mord",40000]};
	case "110": {_type = ["Mord AMOK Personal",50000]};
	case "200": {_type = ["Raubüberfall",7500]};
	case "205": {_type = ["Tankstellenüberfall",7500]};
	case "207": {_type = ["Banküberfall",15000]};
	case "210": {_type = ["Versuchter Fahrzeugdiebstahl",2500]};
	case "215": {_type = ["Fahrzeugdiebstahl",5000]};
	case "300": {_type = ["Geringer Drogenbesitz",1000]};
	case "301": {_type = ["Drogenbesitz",2000]};
	case "302": {_type = ["Schwerer Drogenbesitz",3000]};
	case "305": {_type = ["Geringer Drogenschmuggel",2500]};
	case "307": {_type = ["Drogenschmuggel",7500]};
	case "310": {_type = ["Drogenhandel",5000]};
	case "315": {_type = ["Schwerer Drogenschmuggel",20000]};
	case "317": {_type = ["Professioneller Drogenschmuggel",40000]};
	case "400": {_type = ["Illegaler Waffenbesitz",5000]};
	case "800": {_type = ["Gefängnisausbruch",25000]};
	case "907": {_type = ["Führerscheinentzug",2000]};
	case "910": {_type = ["Geiselnahme",2500]};
	default {_type = []};
};

_type;