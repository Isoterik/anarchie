/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Yellow"};
			case 2: {_color = "White"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Dark Red"};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Cyan"};
			case 7: {_color = "Monster"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "DHL"};
			case 10: {_color = "Flecktarn"};
			case 11: {_color = "ATAC"};
			case 12: {_color = "AMOK"};
			case 13: {_color = "Notarzt"};		
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Green"};
			case 2: {_color = "Blue"};
			case 3: {_color = "Dark Blue"};
			case 4: {_color = "Yellow"};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
			case 8: {_color = "Hellokitty"};
			case 9: {_color = "Metallica"};
			case 10: {_color = "Sky"};
			case 11: {_color = "Pimp"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Hellokitty"};
			case 7: {_color = "Metallica"};
			case 8: {_color = "Sky"};
			case 9: {_color = "Pimp"};
			case 10: {_color = "Monster"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red"};
			case 1: {_color = "Black"};
			case 2: {_color = "Silver"};
			case 3: {_color = "Orange"};
			case 4: {_color = "Batman"};
			case 5: {_color = "Superman"};
			case 6: {_color = "Camo"};
			case 7: {_color = "2Fast"};
			case 8: {_color = "Kitty"};
			case 9: {_color = "Taxi"};
			case 10: {_color = "VIP"};
			case 11: {_color = "Rebellen"};
			case 12: {_color = "CarbonV1"};
			case 13: {_color = "CarbonV2"};
			case 14: {_color = "AMOK"};
			case 20: {_color = "Notarzt"};			
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Blue"};
			case 2: {_color = "Red"};
			case 3: {_color = "White"};
			case 4: {_color = "Brown"};
			case 5: {_color = "Digi Green"};
			case 6: {_color = "Hunter Camo1"};
			case 7: {_color = "Hunter Camo2"};
			case 8: {_color = "Digi Desert"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Old but Gold"};
			case 1: {_color = "Ion"};
			case 2: {_color = "Blue"};
			case 3: {_color = "Red"};
			case 4: {_color = "Blueline"};
			case 5: {_color = "Elliptical"};
			case 6: {_color = "Furious"};
			case 7: {_color = "Jeans Blue"};
			case 8: {_color = "Speedy Redline"};
			case 9: {_color = "Sunset"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Waves Blue"};
			case 12: {_color = "Rebel Digital"};
			case 13: {_color = "Wespe"};
			case 14: {_color = "Flames"};
			case 15: {_color = "Back&Red"};
			case 16: {_color = "Tarn"};
			case 17: {_color = "Notarzt"};
			case 18: {_color = "AMOK"};
			case 19: {_color = "Digi Green"};
			case 20: {_color = "ATAC"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F": // orca
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "AMOK"};
		};
	};
	
	case "B_MRAP_01_F": // Hunter
	{
		switch (_index) do
		{
			case 0: {_color = "AMOK"};
		};
	};

	case "B_MRAP_01_hmg_F": // Hunter
	{
		switch (_index) do
		{
			case 0: {_color = "AMOK"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
		};
	};

	case "I_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "ATAC"};
		};
	};

	case "O_Truck_02_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
		};
	};
	
	/*
	case "O_Truck_03_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Grau-Gelb"};
		};
	};
	*/
			
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "I_MRAP_03_F": //Strider
	{
		switch (_index) do
		{
			case 0: {_color = "Civ"};
			case 1: {_color = "VIP"};
			case 2: {_color = "Black"};
			case 3: {_color = "White"};
			case 4: {_color = "Schuppen"};
			case 5: {_color = "AMOK"};
		};
	};

	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "AMOK"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "AMOK"};
		};
	};
};

_color;