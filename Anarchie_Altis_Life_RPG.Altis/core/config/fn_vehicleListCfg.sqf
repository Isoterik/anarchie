#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return","_localDonatorDiscount"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];

//DonatorDiscount
_localDonatorDiscount = __GETC__(life_donator);
_localDonatorDiscount = 1 - (_localDonatorDiscount * 0.1);

switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};

	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",1000],
			["C_SUV_01_F",1500]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",13750]
		];
	};

	case "adac_shop":
	{
		_return = [
			["C_Offroad_01_F",1000]
		];
	};
    
	case "adac_truck":
	{
		_return = [
			["I_Truck_02_box_F",15000]
		];
	};

	case "adac_air": {
		_return = [
			["B_Heli_Light_01_F",13750]
		];
	};
    	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",300 * _localDonatorDiscount],
			["C_Hatchback_01_F",1300 * _localDonatorDiscount],
			["C_Hatchback_01_sport_F",2250 * _localDonatorDiscount],
			["C_Offroad_01_F",3000 * _localDonatorDiscount],
			["C_SUV_01_F",4500 * _localDonatorDiscount],
			["C_Van_01_transport_F",6750 * _localDonatorDiscount],
			["C_Van_01_box_F",7500 * _localDonatorDiscount],
			["C_Van_01_fuel_F",9375 * _localDonatorDiscount]
		];
	}; 
		
	case "civ_truck":
	{
		_return =
		[
			["I_Truck_02_transport_F",17000 * _localDonatorDiscount],
			["I_Truck_02_covered_F",20400 * _localDonatorDiscount],
			["I_Truck_02_box_F",25500 * _localDonatorDiscount],
			["B_Truck_01_mover_F",45000 * _localDonatorDiscount],
			["O_Truck_03_transport_F",66500 * _localDonatorDiscount],
			["O_Truck_03_ammo_F",76000 * _localDonatorDiscount],
			["O_Truck_03_covered_F",90000 * _localDonatorDiscount],
			["O_Truck_03_repair_F",115500 * _localDonatorDiscount],
			["B_Truck_01_transport_F",200000 * _localDonatorDiscount],
			["B_Truck_01_ammo_F",218750 * _localDonatorDiscount],
			["B_Truck_01_covered_F",256250 * _localDonatorDiscount]	
		];	
	};

	case "civ_fueltruck":
	{
		_return =
		[
			["O_Truck_02_fuel_F",34000 * _localDonatorDiscount],
			["O_Truck_03_fuel_F",131250 * _localDonatorDiscount]
		];	
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",55000 * _localDonatorDiscount],
			["O_Heli_Light_02_unarmed_F",118250 * _localDonatorDiscount]
		];
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",6375 * _localDonatorDiscount],
			["C_Boat_Civil_01_F",14625 * _localDonatorDiscount]
		];
	};
		
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",400],
			["B_G_Offroad_01_F",3500],
			["O_MRAP_02_F",250000]
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_G_Offroad_01_armed_F",180000]];
		};
	};
		
	case "reb_air":
	{
		["B_Heli_Light_01_F",55000],
		["O_Heli_Light_02_unarmed_F",118250]
	};
	
	case "cop_car":
	{
		_return set[count _return,["C_Offroad_01_F",600]];
		_return set[count _return,["C_SUV_01_F",900]];
		_return set[count _return,["B_MRAP_01_F",32000]];
		_return set[count _return,["I_MRAP_03_F",46000]];
		_return set[count _return,["B_MRAP_01_hmg_F",58500]];

		/*
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["C_SUV_01_F",900]];
		};
		
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,["B_MRAP_01_F",10000]];
		};
		
		if(__GETC__(life_coplevel) > 8) then
		{ 
			_return set[count _return,["I_MRAP_03_F",15000]];
		};
		
		if(__GETC__(life_coplevel) > 9) then
		{
		    _return set[count _return,["B_MRAP_01_hmg_F",22500]];
		};
		*/
	};

	case "cop_air":
	{
		_return set[count _return,["B_Heli_Light_01_F",22000]];
		_return set[count _return,["I_Heli_light_03_unarmed_F",36893]];
		_return set[count _return,["O_Heli_Light_02_unarmed_F",48333]];
		_return set[count _return,["B_Heli_Transport_01_F",79417]];

		/*
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",11000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,["I_Heli_light_03_unarmed_F",16893]];
		};
		if(__GETC__(life_coplevel) > 8) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",18333]];
		};		
		if(__GETC__(life_coplevel) > 9) then
		{
	        _return set[count _return,["B_Heli_Transport_01_F",39417]];
		};
		*/
	};
				
	case "cop_ship":
	{
		_return set[count _return,["B_Boat_Transport_01_F",1275]];
		_return set[count _return,["C_Boat_Civil_01_police_F",2925]];
		_return set[count _return,["B_Boat_Armed_01_minigun_F",29750]];
		_return set[count _return,["B_SDV_01_F",42187]];
		
		/*
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["C_Boat_Civil_01_police_F",2925]];
		};
		
		if(__GETC__(life_coplevel) > 9) then
		{
			_return set[count _return,["B_Boat_Armed_01_minigun_F",9750]];
			_return set[count _return,["B_SDV_01_F",12187]];
		};
		*/
	};
};

_return;
