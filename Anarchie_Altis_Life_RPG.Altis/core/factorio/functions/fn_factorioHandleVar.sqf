/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* fn_factorioHandleVar.sqf
* return the life inv item name or the factorio if item name
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0: String - var name
* _this select 1: INTEGER - mode
*/

private["_varName","_mode"];

_varName = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[1]] call BIS_fnc_param;

//exit condition
if ((_varName == "") || (_mode == -1)) exitWith {};

switch(_mode) do {
	//factorio inv -> life inv
	case 0: {
		switch(_varName) do {
			case "ftyre": {"tyre";};
			case "fbody": {"body";};
			case "fseats": {"seats";};
			case "fcable": {"cable";};
			case "fglass": {"glass";};
			case "foilp": {"oilp";};
			default {""};
		};
	};
	//life inv -> factorio inv
	case 1: {
		switch(_varName) do {
			case "tyre": {"ftyre";};
			case "body": {"fbody";};
			case "seats": {"fseats";};
			case "cable": {"fcable";};
			case "glass": {"fglass";};
			case "oilp": {"foilp";};
			default {""};				
		};
	};		
};