/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {["oilu","oilp",38,"Verarbeite Oel"];};
	case "diamond": {["diamond","diamondr",35,"Waescht Diamantenabraum"]};
	case "gold": {["goldore","goldbar",33,"Verarbeite Goldabraum"]};
	case "silver": {["silverore","silverbar",30,"Verarbeite Silbererz"]};
	case "heroin": {["heroinu","heroinp",30,"Stellt Heroin her"]};
	case "copper": {["copperore","copper_r",23,"Verarbeite Kupfererz"]};
	case "iron": {["ironore","iron_r",25,"Verarbeite Eisenerz"]};
	case "sand": {["sand","glass",28,"Schmelze Sand"]};
	case "salt": {["salt","salt_r",30,"Verarbeite Saltz"]};
	case "cocaine": {["cocaine","cocainep",33,"Stellt Kokaine her"]};
	case "marijuana": {["cannabis","marijuana",28,"Trocknet Cannabisblueten"]};
	case "cement": {["rock","cement",25,"Mixt Zement"]};
	case "wood": {["woodu","woodp",30,"Saege Holz"]};
	case "froglsd": {["frog","froglsd",30,"Stellt LSD her"]};
	case "frogeat": {["frog","frogeat",15,"Schlachte Froesche"]};
	case "applewine": {["apple","applewine",12,"Keltere Apfelmost"]};
	case "wodka": {["potato","wodka",13,"Brennt Wodka"]};
	case "peachbooze": {["peach","peachbooze",12,"Brennt Pfirsichschnaps"]};
	case "pearbooze": {["pear","pearbooze",13,"Brennt Birnenschnaps"]};
	case "wine": {["grape","wine",13,"Keltere Wein"]};
	case "honey": {["honeyu","honeyp",10,"Ruehre Honig"]};
	case "milk": {["milku","milkp",10,"Pasteurisiere Milch"]};
	case "tabacco": {["tabaccou","tabaccop",20,"Trocknet Tabackblaetter"]};
	case "tyre": {["rubber","tyre",27,"Stelle Reifen her"]};
	case "rubber": {["caoutchouc","rubber",15,"Stelle Gummi her"]};
	case "leather": {["cowskin","leather",24,"Gerbe Leder"]};
	case "seats": {["leather","seats",40,"Baue Innenverkleidungen"]};
	case "metalparts": {["iron_r","metalparts",25,"Stellt Metallteile her"]};
	case "body": {["metalparts","body",54,"Stellt Karroserieteile her"]};
	case "flour": {["cereals","flourp",12,"Mahle Getreide"]};
	case "medmarijuana": {["cannabis","medmarijuana",18,"Stellt Medizinisches Marijuana her"]};

	//Stationary Jobs
	case "cheese": {["milks","cheesep",0,"Macht Kaese"]};
	case "butter": {["milks","butterp",0,"Stellt Butter her"]};
	case "cigar": {["tabaccos","cigar",0,"Drehe Zigarren"]};

	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_type in [""]) then {
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

if(_newItem == "applewine")then{
	_addVal = floor(_oldVal / 2);
}else{
	_addVal = _oldVal;
};
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Du musst innerhalb von 10m zum Verarbeiten sein."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Du hast %1 zu %2 verarbeitet. Weil du die Lizens hast, hat es dich nichts gekostet.",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_cash < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizens verarbeiten zu koennen!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	
	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
	if(player distance _vendor > 10) exitWith {hint "Du musst innerhalb von 10m zum Verarbeiten sein."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["Du brauchst $%1 um ohne Lizens verarbeiten zu koennen!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Du hast %1 zu %2 verarbeitet fuer $%3",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};	