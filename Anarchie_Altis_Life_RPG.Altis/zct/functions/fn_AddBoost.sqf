private ["_nearVehicles","_vehicle","_vehOwner","_vehData"];


if(life_cash < 10000)exitwith{hint "Zuwenig Kohle!"};
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos player,["Car"],30]; //Fetch vehicles within 30m.
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

if(isNil "_vehicle") exitWith {hint "Es ist kein Fahrzeug in der nähe das getuned werden könnte."};
if(isNull _vehicle) exitWith {};


if(_vehicle getVariable ["boost",[false]] select 0 )exitwith
{
	hint "Dein Fahrzeug hat bereits einen Nitro Boost";
};


switch (typeOf _vehicle) do
{
	case "B_Quadbike_01_F":
	{
		_vehicle setVariable ["boost",[true,100,100,10,2,10],true];
	};

	case "C_SUV_01_F":
	{
		_vehicle setVariable ["boost",[true,100,200,40,2,10],true];
	};

	case "C_Hatchback_01_F":
	{
		_vehicle setVariable ["boost",[true,100,210,40,2,10],true];
	};

	case "C_Hatchback_01_sport_F":
	{
		_vehicle setVariable ["boost",[true,100,240,50,2,10],true];
	};

	case "C_Offroad_01_F":
	{
		_vehicle setVariable ["boost",[true,100,180,30,2,10],true];
	};

	case "C_Van_01_box_F";
	case "C_Van_01_transport_F":
	{
		_vehicle setVariable ["boost",[true,100,100,30,2,10],true];
	};
	
	case "I_Truck_02_covered_F";
	case "I_Truck_02_transport_F":
	{
		_vehicle setVariable ["boost",[true,100,100,30,2,10],true];
	};

	case "B_MRAP_01_F";
	case "I_MRAP_03_F":
	{
		_vehicle setVariable ["boost",[true,100,200,60,2,10],true];
	};


	default { _vehicle setVariable ["boost",[true,100,150,30,2,10],true]; };
};

hint "Dein Fahrzeug hat jetzt einen Nitro Boost";
life_cash = life_cash - 10000;