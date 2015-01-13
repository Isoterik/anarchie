/*	fn_factorioCfg
	author: preller @ freudenhaus <codepreller@hirnstrom.net> 

	defines items which can be produced

	PARAM:
	_this select 0 - STRING - itemType
*/

private ["_itemType","_items"];
_itemType = [_this,0,"",[""]] call BIS_fnc_param;
_items = [];

 
switch(_itemType) do {
	//use following syntax ["VEHICLE_TYPE",["varHandleItemNeeded1","varHandleItemNeeded1"],["itemsNeeded1","itemsNeeded2"],price]
	
	case "vehicles": {_items = 
			[
				["B_Truck_01_box_F",["ftyre","fbody","fseats","fcable","fglass","foilp"],[8,2850,850,1000,600,400],1000]
			];
	};
};

_items;