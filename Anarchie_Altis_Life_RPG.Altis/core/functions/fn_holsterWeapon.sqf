if (vehicle player != player) exitWith {};
if (player getVariable "restrained") exitWith {};

if (!life_holstered) then {
	
	if (currentWeapon player != handgunWeapon player) exitWith 
	{
		hint "Sie haben keine Pistole in der Hand";
	};
		
	
	if (currentWeapon player == "") exitWith {};
	
	life_holstered_weapon = currentWeapon player;
	life_holstered_magazine = currentMagazine player;
	life_holstered_ammo = player ammo life_holstered_weapon;
	life_holstered_items = handgunItems player;
	
	titleText ["Holstere Pistole", "PLAIN"];
	player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon";
	sleep 1;

	player removeWeapon life_holstered_weapon;
	life_holstered = !life_holstered;

} else {

	if (isNil "life_holstered_weapon") exitWith {};
	
	titleText ["Ziehe Pistole", "PLAIN"];
	sleep 1;
	
	player addWeapon life_holstered_weapon;
	sleep 0.2;
	player selectWeapon life_holstered_weapon;


	if(life_holstered_magazine != "")then
	{
		player addMagazine life_holstered_magazine;
		player setAmmo [life_holstered_weapon, life_holstered_ammo];
	};

	
	{
		if(_x != "")then
		{
			player addHandgunItem _x;
		};
	} forEach life_holstered_items;
	
	
	


	life_holstered_ammo = "";
	life_holstered_weapon = "";
	life_holstered_items = ["","","",life_holstered_ammo];
	life_holstered_magazine = "";
	

	life_holstered = !life_holstered;
};