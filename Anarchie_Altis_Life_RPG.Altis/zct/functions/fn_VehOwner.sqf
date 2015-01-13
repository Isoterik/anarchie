private ["_unit","_vehicle","_vehname","_vehOwner","_vehData","_nearVehicles"];

_nearVehicles = nearestObjects[getPos player,["Car","Air"],30]; //Fetch vehicles within 30m.

if(count _nearVehicles > 0) then
{
	{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((getPlayerUID player) == _vehOwner) exitWith
			{
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;
};


if(isNil "_vehicle") exitWith {hint "Da ist kein Fahrzeug das dir gehört";};
if(isNull _vehicle) exitWith {};


_vehname = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_unit = driver _vehicle;


if(isnil "_unit") exitWith {hint "Der Neue Besitzer solte auf dem Fahrersitz sein";};
if(_unit == player || (getPlayerUID player) == _vehOwner) exitWith {hint "Dieses Fahrzeug gehört bereits dir";};

_vehicle setVariable["vehicle_info_owners",[[getPlayerUID _unit,name _unit]],true];

// [[(getPlayerUID _unit),side _unit,_vehicle,_color],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;

[[_vehicle],"TON_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;


hint format["%1 wurde Registriert für %2",_vehname,name _unit];
[[1,format["Du bist jetzt der Besitzer von: %1",_vehname],true],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;


[["owner",player,_vehicle,(getPlayerUID player),(getPlayerUID _unit),""],"TON_fnc_updateVehicle",false,false] spawn life_fnc_MP;