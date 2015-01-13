/* fn_gasman.sqf
written by an unknown person. maybe tonic? 

edited by: |bb| stone & preller

*/

private ["_pos","_denied1","_gasstation","_robberycash","_timer","_toFar","_countDown"];

_gasstation = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_pos = GetPos player;
_denied1 = false;

removeAllactions _gasstation;

//edit by preller: changed from cops to every fraction except civs
if(playerSide != civilian) exitWith {};
{
	hint "Was denkst du, was du hier tust? Du bist kein Krimineller!";
	_gasstation addAction["Laden",life_fnc_weaponShopMenu,"genstore"];      
	_gasstation addAction["Verpflegung",life_fnc_virt_menu,"market"];
	_gasstation addAction["Ausrauben",life_fnc_gasman,"gasman"];
};

if(!(_gasstation getVariable["robprogress",true])) exitWith 
{
	hint "Diese Tankstelle wird gerade ausgeraubt.";
	_gasstation addAction["Laden",life_fnc_weaponShopMenu,"genstore"];      
	_gasstation addAction["Verpflegung",life_fnc_virt_menu,"market"];
	_gasstation addAction["Ausrauben",life_fnc_gasman,"gasman"];
};

if(!(_gasstation getVariable["gaswait",true])) exitWith 
{
	hint "Diese Tankstelle wurde vor kurzem ausgeraubt.";
	_gasstation addAction["Laden",life_fnc_weaponShopMenu,"genstore"];      
	_gasstation addAction["Verpflegung",life_fnc_virt_menu,"market"];
	_gasstation addAction["Ausrauben",life_fnc_gasman,"gasman"];
};

if(currentWeapon player !="")then 
		{
			if(currentWeapon player !="Binocular") then
			{
				[[2,"Eine Tankstelle wird ausgeraubt!",true],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
				_gasstation setVariable["robProgress",false,true];
				_Pos = position player;
				_marker = createMarker ["Marker200", _Pos];
				"Marker200" setMarkerColor "ColorRed";
				"Marker200" setMarkerText "!ACHTUNG! RAEUBER !ACHTUNG!";
				"Marker200" setMarkerType "mil_warning";
				_number = floor(random 5);
				if (_number == 0) then {robberyreward = 1000;};
				if (_number == 1) then {robberyreward = 2000;};
				if (_number == 2) then {robberyreward = 2500;};						
				if (_number == 3) then {robberyreward = 5000;};
				if (_number == 4) then {robberyreward = 7500;};
				if (_number == 5) then {robberyreward = 10000;};
				life_action_inUse = true;
			} else {hint "Verschwinde lieber, bevor ich den AMOK-Sicherheitsdienst rufe!"; _denied1 = true;};
		} else {hint "Verschwinde lieber, bevor ich die AMOK-Sicherheitsdienst rufe!"; _denied1 = true;};		

if(_denied1) exitwith
{
	_gasstation addAction["Laden",life_fnc_weaponShopMenu,"genstore"];      
	_gasstation addAction["Verpflegung",life_fnc_virt_menu,"market"];
	_gasstation addAction["Ausrauben",life_fnc_gasman,"gasman"];
};
if(!alive player) exitWith {life_action_inUse = false;
};

sleep 2;
_robberycash = robberyreward;
_timer = time + 180;	
_toFar = false;

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 Minute(n)",round(round(_timer - time) / 60)]} else {format["%1 Sekunde(n)",round(_timer - time)]};
	hintSilent format["Du darfst dich nicht mehr als 15 Meter entfernen!\n\nVerbleibende Zeit:\n %1\n\nDistanz: %2m",_countDown,round(player distance _gasstation)];

	if(player distance _gasstation > 15) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {hint "Du wurdest getasert und dein kleiner Raub ist fehlgeschlagen!";};
};

switch(true) do
{
	case (_toFar):
	{
		hint "Du hast dich zu weit entfernt!";
		deleteMarker "Marker200";
		_denied1 = false;
		_gasstation setVariable["robProgress",true,true];
		life_action_inUse = false;
	};
	
	case (!alive player):
	{
		hint "Wer gibt denn einem Toten seine Beute? Niemand. Du hast versagt.";
		deleteMarker "Marker200";
		_denied1 = false;
		_gasstation setVariable["robProgress",true,true];
		life_action_inUse = false;
	};
	
	case (life_istazed):
	{
		hint "Du wurdest getasert und dein kleiner Raub ist fehlgeschlagen!";
		deleteMarker "Marker200";
		_denied1 = false;
		_gasstation setVariable["robProgress",true,true];
		life_action_inUse = false;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["Du hast erfolgreich %1€ gestohlen.", _robberycash];
		life_cash = life_cash + _robberycash;
		[[getPlayerUID player,profileName,"205"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		_gasstation setVariable["robProgress",true,true];
		_gasstation setVariable["gaswait",true,true];
		deleteMarker "Marker200";
		_denied1 = false;
		life_action_inUse = false;
	};	
};

_gasstation addAction["Laden",life_fnc_weaponShopMenu,"genstore"];      
_gasstation addAction["Verpflegung",life_fnc_virt_menu,"market"];

sleep 3600;
_gasstation addAction["Ausrauben",life_fnc_gasman,"gasman"];
_gasstation setVariable["gaswait",true,true];
life_action_inUse = false;