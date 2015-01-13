#include <macro.h>
/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_hideout"];
if((lbCurSel 2401) == -1) exitWith {hint "Du musst einen Gegenstant zum kaufen auswaehlen."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call fnc_isnumber)) exitWith {hint "Du hast keine tatsaechliche Zahl eingegeben";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Du hast nicht genug Platz fuer diese Menge!"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint "Du hast nicht genug Geld!"};
if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Du hast nicht so viel Geld!";};
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then {
		_action = [
			format["Deine Firma hat genug Geld um zu bezahlen, m�chtest du auf Firmenkosten bezahlen oder selbst?<br/><br/>Firmenkonto: <t color='#8cff9b'>$%1</t><br/>Dein Konto: <t color='#8cff9b'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			"Zahle mit Eigenem oder Firemengeld",
			"Firmengeld",
			"Mein Geld"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format["Du hast %1 %2 f�r $%3 mit Firmengeld gekauft.",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Du hast nicht genug Geld!";};
			hint format["Du hast %1 %2 fuer $%3 gekauft.",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(life_cash,_price);
		};
	} else {
		if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Du hast nicht genug Geld!";};
		hint format["Du hast %1 %2 fuer $%3 gekauft.",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
	};
	[] call life_fnc_virt_update; 
};
