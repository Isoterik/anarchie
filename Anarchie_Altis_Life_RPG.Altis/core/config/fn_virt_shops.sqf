/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","apple","peach","pear","grape","tbacon","rabbit","honeyp","cheesep","redgull","proteinshake","fishing","lockpick","pickaxe","fuelF","fuelE","storagesmall","storagebig"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","redgull","tbacon","lockpick","ziptie","pickaxe","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Spezialitäten",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Kaffee Club",["coffee","donuts"]]};
	case "heroin": {["Dealer",["cocainep","heroinp","marijuana","froglsd","methp","croco","cocaineps"]]};
	case "oil": {["Oelhaendler",["oilp","fuelF"]]};
	case "fishmarket": {["Altis Fischmarkt",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Glashaendler",["glass"]]};
	case "iron": {["Altis Industriehaendler",["iron_r","copper_r"]]};
	case "diamond": {["Diamantenhaendler",["diamondr"]]};
	case "salt": {["Salzhaendler",["salt_r"]]};
	case "cop": {["AMOK Verpflegung",["donuts","coffee","spikeStrip","water","rabbit","apple","proteinshake","redgull","fuelF","goldendonat"]]};
	case "cement": {["Zementhaendler",["cement"]]};
	case "gold": {["Altis Silber- und Goldhandel",["goldbar","silverbar"]]};
	case "wood": {["Holzhaendler",["woodu","woodp"]]};
	case "frogeat": {["Froschhaendler",["frogeat"]]};
	case "alcohol": {["Kiosk Elmar Trunkenbolz",["water","beer","applewine","wodka","peachbooze","pearbooze","wine","cigar","tabaccop","bunp","cheesestickp","sausage","donuts"]]};
	case "drugs": {["Aphotheke Rosenbluete",["eyedrops","pseudo","medmarijuana"]]};
	case "arzt": {["Notarzt Verpflegung",["coffee","donuts","redgull","proteinshake","fuelF"]]};
	case "adac": {["ATAC Verpflegung",["coffee","donuts","redgull","proteinshake","fuelF"]]};
	case "cheese": {["Kaeserei",["cheesep","milkp","butterp"]]};
	case "cheesestash": {["Kaesereilager",["milks"]]};
	case "antiques": {["Antiquitaeten",["antiques"]]};
	case "cigar": {["Zigarrenmanufaktur",["cigar"]]};
	case "cigarstash": {["Zigarrenmanufakturlager",["tabaccos"]]};
	case "shoemaker": {["Schuster",["leather"]]};
	case "tyre": {["Reifenhaendler",["tyre"]]};
	case "trinket": {["Juwelier",["trinket"]]};
	case "butcher": {["Metzger",["sausage","herpp","cowskin"]]};
	case "butcherstash": {["Metzgerlager",["herps","beef"]]};
	case "electricstore": {["Elektronikhandel",["cable"]]};
	case "rubber": {["Gummihandel",["rubber"]]};
	case "baker": {["Baecker",["bunp","buns","cheesestickp","cheesesticks","eggp","flourp","honeyp"]]};
	case "bakerstash": {["Baeckerlager",["milks","eggs","flours","cheeses"]]};
	case "factorio": {["Factorio Ankauf",["tyre","cable","body","seats"]]};
	case "jail": {["Gefaengniskantine",["jailmeal"]]};
};