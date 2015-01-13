/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{

	case "B_Quadbike_01_F": {20};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {40};
	case "C_SUV_01_F": {50};
	case "C_Offroad_01_F": {70};
	case "C_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {125};
	case "C_Van_01_fuel_F": {175};
	case "I_Truck_02_transport_F": {175};
	case "I_Truck_02_covered_F": {200};
	case "I_Truck_02_box_F": {225};
	case "O_Truck_02_fuel_F": {275};
	case "B_Truck_01_mover_F": {250};
	case "O_Truck_03_device_F": {300};
	case "O_Truck_03_transport_F": {325};
	case "O_Truck_03_ammo_F": {350};
	case "O_Truck_03_covered_F": {375};
	case "O_Truck_03_repair_F": {400};
	case "O_Truck_03_fuel_F": {450};
	case "B_Truck_01_transport_F": {500};
	case "B_Truck_01_ammo_F": {525};
	case "B_Truck_01_covered_F": {550};
	case "B_Truck_01_box_F": {600};
	case "B_Truck_01_fuel_F": {650};
	case "I_MRAP_03_F": {75};
	case "B_Heli_Light_01_F": {75};
	case "O_Heli_Light_02_unarmed_F": {175};
	case "I_Heli_Transport_02_F": {250};
	case "C_Rubberboat": {70};
	case "C_Boat_Civil_01_F": {150};
	case "B_G_Offroad_01_F": {70};
	case "B_G_Offroad_01_armed_F": {75};
	case "O_MRAP_02_F": {75};
	case "B_MRAP_01_F": {75};
	case "B_MRAP_01_hmg_F": {75};
	case "I_Heli_Light_03_unarmed_F": {175};
	case "B_Heli_Transport_01_F": {200};
	case "B_Boat_Transport_01_F": {45};
	case "C_Boat_Civil_01_police_F": {70};
	case "B_Boat_Armed_01_minigun_F": {70};
	case "B_SDV_01_F": {70};
	case "Land_CargoBox_V1_F": {5000};	
	default {-1};
};