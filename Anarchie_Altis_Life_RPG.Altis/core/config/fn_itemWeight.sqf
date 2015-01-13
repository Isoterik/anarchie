/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
    //essen
    case "apple": {2};
    case "peach": {2};
    case "donuts": {1};
    case "goldendonat": {2};
    case "rabbit": {2};
    case "tbacon": {2};
    case "frogeat": {1};
    case "mackerel": {2};
    case "ornate": {2};
    case "salema": {2};
    case "tuna": {2};
    case "mullet": {2};
    case "catshark": {4};
    case "honeyu": {2};
    case "honeyp": {1};
    case "cheeses": {1};
    case "cheesep": {3};
    case "butters": {2};
    case "butterp": {2};
    case "buns": {2};
    case "bunp": {1};
    case "cheesesticks": {2};
    case "cheesestickp": {1};
    case "sausage": {1};

    //getränke
	case "water": {1};
    case "coffee": {1};
    case "redgull": {2};
    case "beer": {1};
    case "applewine": {1};
    case "wodka": {2};
    case "proteinshake": {2};
    case "milku": {2};
    case "milkp": {2};
    case "milks": {1};
    case "peachbooze": {1};
    case "pearbooze": {1};
    case "grape": {2};
    case "wine": {1};

    //legal
    case "oilu": {4};
    case "oilp": {2};
    case "copperore": {4};
    case "copper_r": {2};
    case "ironore": {4};
    case "iron_r": {2};
    case "silverore": {4};
    case "silverbar": {2};
    case "goldore": {4};
    case "goldbar": {2};
    case "diamond": {4};
    case "diamondc": {2};
    case "sand": {4};
    case "glass": {2};
    case "salt": {4};
    case "salt_r": {2};
    case "rock": {4};
    case "cement": {2};
    case "woodu": {4};
    case "woodp": {2};
    case "cereals": {2};
    case "frog": {2};
    case "eyedrops": {1};
    case "pseudo": {1};
    case "herps": {1};
    case "herpp": {1};
    case "eggs": {1};
    case "eggp": {1};
    case "flours": {1};
    case "flourp": {1};
    case "hops": {2};
    case "malt": {2};
    case "potato": {2};
    case "pear": {2};
    case "tabaccou": {3};
    case "tabaccop": {2};
    case "tabaccos": {1};
    case "cigar": {1};
    case "caoutchouc": {2};
    case "rubber": {2};
    case "tyre": {1};
    case "cable": {2};
    case "metalparts": {2};
    case "body": {3};
    case "beef": {2};
    case "cowskin": {3};
    case "leather": {2};
    case "seats": {2};
    case "antiques": {4};
    case "trinket": {4};
    case "medmarijuana": {1};

    //illegal
    case "turtle": {10};
    case "turtlesoup": {2};
    case "heroinu": {2};
    case "heroinp": {1};
    case "cocaine": {2};
    case "cocainep": {1};
    case "cocaineps": {1};
    case "marijuana": {1};
    case "cannabis": {2};
    case "froglsd": {1};
    case "croco": {1};
    case "methu": {2};
    case "methp": {1};
    
    //sonstiges
    case "fishing": {2};
    case "lockpick": {1};
    case "pickaxe": {2};
    case "spikeStrip": {3};
    case "fuelE": {2};
    case "fuelF": {4};
    case "storagesmall": {15};
    case "storagebig": {30};
    case "money": {0};
    case "ziptie": {1};
    case "goldbank": {2};
    case "blastingcharge": {10};
    case "boltcutter": {5};
    case "defusekit": {2};
	default {1};
};
