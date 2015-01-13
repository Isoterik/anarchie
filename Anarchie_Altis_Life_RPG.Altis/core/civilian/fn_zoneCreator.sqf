/*
	File: fn_zoneCreator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Creates triggers around the map to add the addAction for specific
	fields such as apples, cocaine, heroin, etc. This method is to reduce
	CPU load.
	
	Note: 
	Triggers are NOT my preferred method so this is considered temporary until a more suitable
	option is presented.
*/
private["_appleZones","_peachZones","_heroinZones","_cocaineZones","_weedZones","_woodZones","_digZones","_oilZones","_frogZones","_cerealsZones","_methZones","_honeyZones","_milkZones","_herpZones","_eggZones","_hopsZones","_maltZones","_potatoZones","_pearZones","_grapeZones","_tabaccoZones","_caoutchoucZones"];
_appleZones = ["apple_1","apple_2"];
_peachZones = ["peaches_1"];
_heroinZones = ["heroin_1"];
_cocaineZones = ["cocaine_1"];
_weedZones = ["weed_1"];
_woodZones = ["wood_1"];
_digZones = ["lead_1","gold_1","iron_1","silver_1","salt_1","sand_1","diamond_1","rock_1","antiques_1"];
_oilZones = ["oil_1"];
_frogZones = ["frog_1"];
_cerealsZones = ["cereals_1"];
_methZones = ["meth_1"];
_honeyZones = ["honey_1"];
_milkZones = ["milk_1"];
_herpZones = ["herp_1"];
_eggZones = ["egg_1"];
_hopsZones = ["hops_1"];
_maltZones = ["malt_1"];
_potatoZones = ["potato_1"];
_pearZones = ["pear_1"];
_grapeZones = ["grape_1"];
_tabaccoZones = ["tabacco_1"];
_caoutchoucZones = ["caoutchouc_1"];

//Create apple zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Apples = player addAction['Sammel Äpfel',life_fnc_gatherApples,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Apples;"];
} foreach _appleZones;

//Create peach zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Peaches = player addAction['Sammel Pfirsiche',life_fnc_gatherPeaches,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Peaches;"];
} foreach _peachZones;

//Create heroin zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_heroin = player addAction['Sammel Heroin',life_fnc_gatherHeroin,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Heroin;"];
} foreach _heroinZones;

//Create Weed zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cannabis = player addAction['Sammle Cannabis',life_fnc_gatherCannabis,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Cannabis;"];
} foreach _weedZones;

//Create cocaine zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[100,100,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Coke = player addAction['Sammel Kokaine',life_fnc_gatherCocaine,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Coke;"];
} foreach _cocaineZones;

//Create Wood zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Wood = player addAction['Baum fällen',life_fnc_gatherWood,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Wood;"];
} foreach _woodZones;

//Create Digg zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Dig = player addAction['Benutze Spitzhacke',life_fnc_pickaxeUse,'',0,false,false,'','!life_action_gather && life_inv_pickaxe > 0'];","player removeAction LIFE_Action_Dig;"];
} foreach _digZones;

//Create Oil zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Dig = player addAction['Sammle Oel',life_fnc_pickaxeUse,'',0,false,false,'','!life_action_gather && life_inv_pickaxe > 0'];","player removeAction LIFE_Action_Dig;"];
} foreach _oilZones;

//Create frog zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Frog = player addAction['Frösche suchen',life_fnc_gatherFrog,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Frog;"];
} foreach _frogZones;

//Create cereals zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Cereals = player addAction['Getreide sammeln',life_fnc_gatherCereals,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Cereals;"];
} foreach _cerealsZones;

//Create Meth zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[9,5,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Meth = player addAction['Chemikalien stehlen',life_fnc_gatherMeth,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Meth;"];
} foreach _methZones;

//Create honey zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Honey = player addAction['Sammel Honigwaben',life_fnc_gatherHoney,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Honey;"];
} foreach _honeyZones;

//Create milk zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Milk = player addAction['Milch abfuellen',life_fnc_gatherMilk,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Milk;"];
} foreach _milkZones;

//Create herp zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Herp = player addAction['Kraeuter sammeln',life_fnc_gatherHerp,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Herp;"];
} foreach _herpZones;

//Create egg zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Egg = player addAction['Eier suchen',life_fnc_gatherEgg,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Egg;"];
} foreach _eggZones;

//Create hops zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Hops = player addAction['Ernte Hopfen',life_fnc_gatherHops,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Hops;"];
} foreach _hopsZones;

//Create malt zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Malt = player addAction['Ernte Malz',life_fnc_gatherMalt,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Malt;"];
} foreach _maltZones;

//Create potato zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Potato = player addAction['Ernte Kartoffeln',life_fnc_gatherPotato,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Potato;"];
} foreach _potatoZones;

//Create pear zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Pear = player addAction['Sammel Birnen',life_fnc_gatherPear,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Pear;"];
} foreach _pearZones;

//Create grape zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[25,25,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Grape = player addAction['Sammel Weintrauben',life_fnc_gatherGrape,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Grape;"];
} foreach _grapeZones;

//Create tabacco zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Tabacco = player addAction['Ernte Tabackblätter',life_fnc_gatherTabacco,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Tabacco;"];
} foreach _tabaccoZones;

//Create caoutchouc zones
{
	_zone = createTrigger ["EmptyDetector",(getMarkerPos _x)];
	_zone setTriggerArea[50,50,0,false];
	_zone setTriggerActivation["CIV","PRESENT",true];
	_zone setTriggerStatements["player in thislist","LIFE_Action_Caoutchouc = player addAction['Ernte Kautschuk',life_fnc_gatherCaoutchouc,'',0,false,false,'','!life_action_gather'];","player removeAction LIFE_Action_Caoutchouc;"];
} foreach _caoutchoucZones;
