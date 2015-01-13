/*
	File: fn_medicLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightBlue","_lightleft","_lightright","_lightfrontleft","_lightfrontright","_lightbackleft","_lightbackright","_leftBlue"];
_vehicle = _this select 0;
       
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};
_lightBlue = [0.1, 0.1, 20];
 
//Settings for the left light on top
_lightleft = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightleft setLightColor _lightBlue;
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
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0.2;
_lightright setLightAmbient [0.1,0.1,1];
_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

//Settings for the left light on the front
_lightfrontleft = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightfrontleft setLightColor _lightBlue;
_lightfrontleft setLightBrightness 0.2;
_lightfrontleft setLightAmbient [0.1,0.1,1];
_lightfrontleft setLightAttenuation [0.181, 0, 1000, 130];
_lightfrontleft setLightIntensity 10;
_lightfrontleft setLightFlareSize 0.38;
_lightfrontleft setLightFlareMaxDistance 150;
_lightfrontleft setLightUseFlare true;

//Settings for the right light on the front
_lightfrontright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightfrontright setLightColor _lightBlue;
_lightfrontright setLightBrightness 0.2;
_lightfrontright setLightAmbient [0.1,0.1,1];
_lightfrontright setLightAttenuation [0.181, 0, 1000, 130];
_lightfrontright setLightIntensity 10;
_lightfrontright setLightFlareSize 0.38;
_lightfrontright setLightFlareMaxDistance 150;
_lightfrontright setLightUseFlare true;

//Settings for the left light on the back
_lightbackleft = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightbackleft setLightColor _lightBlue;
_lightbackleft setLightBrightness 0.2;
_lightbackleft setLightAmbient [0.1,0.1,1];
_lightbackleft setLightAttenuation [0.181, 0, 1000, 130];
_lightbackleft setLightIntensity 10;
_lightbackleft setLightFlareSize 0.38;
_lightbackleft setLightFlareMaxDistance 150;
_lightbackleft setLightUseFlare true;

//Settings for the right light on the back
_lightbackright = "#lightpoint" createVehicle getpos _vehicle;
sleep 0.2;
_lightbackright setLightColor _lightBlue;
_lightbackright setLightBrightness 0.2;  
_lightbackright setLightAmbient [0.1,0.1,1];
_lightbackright setLightAttenuation [0.181, 0, 1000, 130];
_lightbackright setLightIntensity 10;
_lightbackright setLightFlareSize 0.38;
_lightbackright setLightFlareMaxDistance 150;
_lightbackright setLightUseFlare true;

//hint format["%1",typeOf _vehicle];
 
switch (typeOf _vehicle) do
{
        case "C_Offroad_01_F":
        {
                _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
				_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
				_lightfrontleft lightAttachObject [_vehicle, [-0.25,2.6,-0.48]];
                _lightfrontright lightAttachObject [_vehicle, [0.15,2.6,-0.48]];
                _lightbackleft lightAttachObject [_vehicle, [-0.87,-2.95,-0.36]];
                _lightbackright lightAttachObject [_vehicle, [0.8,-2.95,-0.36]];

        };

        case "C_SUV_01_F":
        {
                _lightleft lightAttachObject [_vehicle, [-0.38,2.27,-0.51]];
                _lightright lightAttachObject [_vehicle, [0.37,2.27,-0.51]];
                _lightfrontleft lightAttachObject [_vehicle, [-0.38,2.27,-0.51]];
                _lightfrontright lightAttachObject [_vehicle, [0.37,2.27,-0.51]];
                _lightbackleft lightAttachObject [_vehicle, [-0.53,-2.91,-0.23]];
                _lightbackright lightAttachObject [_vehicle, [0.53,-2.91,-0.23]];
        };
        
        default 
	{ 
		_lightleft lightAttachObject [_vehicle, [-0.1,0,0]];
		_lightright lightAttachObject [_vehicle, [0.1,0,0]];
		_lightfrontleft lightAttachObject [_vehicle, [0.1,0,0]];	
		_lightfrontright lightAttachObject [_vehicle, [0.1,0,0]];	
		_lightbackleft lightAttachObject [_vehicle, [0.1,0,0]];
		_lightbackright lightAttachObject [_vehicle, [0.1,0,0]];		
	};
}; 
  
  
//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;
_lightfrontleft setLightDayLight true;
_lightfrontright setLightDayLight true;
_lightbackleft setLightDayLight true;
_lightbackright setLightDayLight true;
 
_leftBlue = true;
while{ (alive _vehicle)} do
{      
        if(!(_vehicle getVariable "lights")) exitWith {};
        if(_leftBlue) then  
        {  
                _leftBlue = false;
                _lightright setLightBrightness 0.0;
                _lightfrontright setLightBrightness 0.0;               
                _lightbackright setLightBrightness 0.0;
                _lightleft setLightBrightness 6;
                _lightfrontleft setLightBrightness 6;
                _lightbackleft setLightBrightness 6;
				sleep 0.2;
        }  
                else  
        {  
                _leftBlue = true;
                _lightleft setLightBrightness 0.0;
                _lightfrontleft setLightBrightness 0.0;
                _lightbackleft setLightBrightness 0.0; 
                _lightright setLightBrightness 6;
                _lightfrontright setLightBrightness 6;
                _lightbackright setLightBrightness 6;
				sleep 0.2;
        };     
};
 
deleteVehicle _lightleft;
deleteVehicle _lightright;
deleteVehicle _lightfrontleft;
deleteVehicle _lightfrontright;
deleteVehicle _lightbackleft;
deleteVehicle _lightbackright;