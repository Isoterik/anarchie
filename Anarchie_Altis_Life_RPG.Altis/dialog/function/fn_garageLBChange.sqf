#include <macro.h>
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; _dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

//Neu : Preiseinteilung in Fraktionen.
switch (side player) do
{
	case civilian:
	{
		_retrievePrice = [_className,__GETC__(life_garage_prices_civ)] call fnc_index;
		_sellPrice = [_className,__GETC__(life_garage_sell_civ)] call fnc_index;
		_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices_civ) select _retrievePrice) select 1;};
		_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(life_garage_sell_civ) select _sellPrice) select 1;};
	};
	
	case west:
	{
		_retrievePrice = [_className,__GETC__(life_garage_prices_cop)] call fnc_index;
		_sellPrice = [_className,__GETC__(life_garage_sell_cop)] call fnc_index;
		_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices_cop) select _retrievePrice) select 1;};
		_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(life_garage_sell_cop) select _sellPrice) select 1;};
	};
	
	case independent:
	{
		_retrievePrice = [_className,__GETC__(life_garage_prices_med)] call fnc_index;
		_sellPrice = [_className,__GETC__(life_garage_sell_med)] call fnc_index;
		_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices_med) select _retrievePrice) select 1;};
		_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(life_garage_sell_med) select _sellPrice) select 1;};
	};
	
	case east:
	{
		_retrievePrice = [_className,__GETC__(life_garage_prices_adac)] call fnc_index;
		_sellPrice = [_className,__GETC__(life_garage_sell_adac)] call fnc_index;
		_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices_adac) select _retrievePrice) select 1;};
		_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(life_garage_sell_adac) select _sellPrice) select 1;};
	};
};

(getControl(2800,2803)) ctrlSetStructuredText parseText format["
	Auspark Gebuehr: <t color='#8cff9b'>$%1</t><br/>
	Verkaufs Preis: <t color='#8cff9b'>$%2</t><br/>
	Farbe: %8<br/>
	V-Max: %3 km/h<br/>
	PS: %4<br/>
	Beifahrersitze: %5<br/>
	Ladekapazitaet: %6<br/>
	Tankvolumen: %7
	",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleColor
];

ctrlShow [2803,true];
ctrlShow [2830,true];