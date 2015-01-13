/*
	File: fn_adacLights.sqf
        Author: mindstorm, modified by Adanteh, modified by Isoterik for Freudenhaus
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightYellow","_lightleft","_lightright","_leftBlue"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightYellow = [20, 18, 0.1];

//Settings for the left light on top
_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightYellow;
_lightleft setLightBrightness 0.2;  
_lightleft setLightAmbient [0.1,0.1,1];
_lightleft setLightAttenuation [0.181, 0, 1000, 130]; 
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

//Settings for the right light on top
_lightright = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightright setLightColor _lightYellow; 
_lightright setLightBrightness 0.2;  
_lightright setLightAmbient [0.1,0.1,1];
_lightright setLightAttenuation [0.181, 0, 1000, 130]; 
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":
	{
                _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
				_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};
	
    default 
	{ 
				_lightleft lightAttachObject [_vehicle, [-0.1,0,0]];
				_lightright lightAttachObject [_vehicle, [0.1,0,0]];
	}; 
};
  

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftBlue = true;
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
        if(_leftBlue) then  
	{  
                _leftBlue = false;
				_lightright setLightBrightness 0.0;  
				_lightleft setLightBrightness 6;  
				sleep 0.2;
	}  
		else  
	{  
                _leftBlue = true;
				_lightleft setLightBrightness 0.0;  
				_lightright setLightBrightness 6;  
				sleep 0.2;
	};  
};  
 
deleteVehicle _lightleft;
deleteVehicle _lightright;