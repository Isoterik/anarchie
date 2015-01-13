/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_name","_icon","_visible","_position","_nearUnits"];
_nearUnits = nearestObjects[(visiblePosition player),["Man"],35];
{
	_hasName = if(!isNil {(_x getVariable "name")}) then {true} else {false};
	if(_hasName && {_x != player}) then {
		_position = visiblePosition _x;
		_position set[2,(getPosATL _x select 2) + 0.5];
		drawIcon3D ["a3\ui_f\data\map\MapControl\hospital_ca.paa",[1,0,0,1],_position,0.6,0.6,0,(_x getVariable ["name","Unknown Player"]),0,0.04];
	} else {
		if(isPlayer _x && {_x != player} && {_x distance player <= 10}) then 
		{
			_visible = lineIntersects [eyePos player, eyePos _x,player, _x];
			if(!_visible) then 
			{
				switch (side _x) do
				{
					case west: 
					{
						_name = format["AMOK Sicherheitsdienst %1", _x getVariable["realname",name _x]];
						_position = visiblePosition _x;
						_position set[2,(getPosATL _x select 2) + 2.2];
						drawIcon3D ["",[1,1,1,1],_position,0,0,0,_name,0,0.04];
					};

					/*
					{
						switch(_x getVariable["coplevel",0])do
						{
							case 1 : {_name = format["Polizeianwärter %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "0" >> "texture");};//Test
							case 2 : {_name = format["Polizeimeister %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "1" >> "texture");};//Test
							case 3 : {_name = format["Polizeikommissar %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "2" >> "texture");};
							case 4 : {_name = format["Stellv. Einsatzleiter Polizei %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "3" >> "texture");};
							case 5 : {_name = format["Einsatzleiter Polizei %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "3" >> "texture");};
							case 6 : {_name = format["Bundespolizei %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "4" >> "texture");};
							case 7 : {_name = format["Stellv. Einsatzleiter Bundespolizei %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "5" >> "texture");};
							case 8 : {_name = format["Einsatzleiter Bundespolizei %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "5" >> "texture");};
							case 9 : {_name = format["SEK Beamter %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "5" >> "texture");};
							case 10 : {_name = format["Stellv. Einsatzleiter SEK %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "6" >> "texture");};
							case 11 : {_name = format["Einsatzleiter SEK %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "6" >> "texture");};
							case 12 : {_name = format["Stellv. Polizeipräsident %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "7" >> "texture");};
							case 13 : {_name = format["Polizeipräsident %1", _x getVariable["realname",name _x]];_icon = getText (configfile >> "CfgRanks" >> "7" >> "texture");};
							default {_name = format["Polizist %1", _x getVariable["realname",name _x]]; _icon = getText (configfile >> "CfgRanks" >> "0" >> "texture");};
						};
					
						_position = visiblePosition _x;
						_position set[2,(getPosATL _x select 2) + 2.2];
						drawIcon3D [_icon,[1,1,1,1],_position,0,0,0,_name,0,0.04];
					};
					*/
				
					case civilian:
					{
						_position = visiblePosition _x;
						_position set[2,(getPosATL _x select 2) + 2.2];
						drawIcon3D ["",[1,1,1,1],_position,0,0,0,_x getVariable["realname",name _x],0,0.04];
					};

					case independent:
					{
						_name = format["Notarzt %1", _x getVariable["realname",name _x]];
						_position = visiblePosition _x;
						_position set[2,(getPosATL _x select 2) + 2.2];
						drawIcon3D ["",[1,1,1,1],_position,0,0,0,_name,0,0.04];
					};
					case east:
					{
						_name = format["ATAC %1", _x getVariable["realname",name _x]];
						_position = visiblePosition _x;
						_position set[2,(getPosATL _x select 2) + 2.2];
						drawIcon3D ["",[1,1,1,1],_position,0,0,0,_name,0,0.04];
					};
				};
			};
		};
	};
} foreach _nearUnits;