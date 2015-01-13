private["_zaap"];


_zaap = "#lightpoint" createVehicle getpos (_this select 0);   
sleep 0.15;
_zaap setLightColor [10, 15, 20];
_zaap setLightAmbient [0.1,0.1,1];
_zaap lightAttachObject [(_this select 0), [0.0, 0.0, 1.3]];
_zaap setLightAttenuation [0.181, 0, 1000, 130]; 
_zaap setLightIntensity 0.5;
_zaap setLightFlareSize 0.1;
_zaap setLightFlareMaxDistance 150;
_zaap setLightUseFlare true;

for "_i" from 0 to 50 do
{
	_zaap setLightBrightness 0.0; 
	sleep 0.03;
	_zaap setLightBrightness 0.5; 
	sleep 0.03;
};

_zaap setLightBrightness 0.0; 
deleteVehicle _zaap;
deleteVehicle "#lightpoint";