private ["_vehicle","_texture","_color","_text","_vehname","_vehOwner","_vehData","_nearVehicles","_id"];

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
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
};

if(isNil "_vehicle") exitWith {hint "Da ist kein Fahrzeug das dir gehört";};
if(isNull _vehicle) exitWith {};


_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; case resistance:{"civ"}; default {"civ"};};

_texture = [typeOf _vehicle] call life_fnc_vehicleColorCfg;

if(isNil {_texture}) exitWith {hint "Dieses Fahrzeug hat keine Skins";};
if(count _texture == 0) exitWith {hint "Keine Skins verfügbar.";};

_color = _vehicle getVariable["color",0];


if(_color < (count _texture - 1)) then
{
	_color = _color + 1;
	while {(_texture select _color) select 1 != _id} do {
		_color = _color + 1;
		if(_color > (count _texture)) exitWith {
			_color = 0;
		};
	};

}else{

	_color = 0;

};

_text = [typeOf _vehicle,_color] call life_fnc_vehicleColorStr;
_vehname = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_vehicle setVariable["color",_color,true];
hint format["Der Skin von %1 auf %2 geändert.",_vehname,_text];
[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;


[["color",player,_vehicle,(getPlayerUID player),"",_color],"TON_fnc_updateVehicle",false,false] spawn life_fnc_MP;
