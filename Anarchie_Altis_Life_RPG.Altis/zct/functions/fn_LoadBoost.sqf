private ["_array","_vehicle"];
_vehicle = _this select 0;
_maxtime = _this select 1;
sleep 5;
while { (_vehicle getVariable "boost" select 1) < 100 && !ZCT_BoostToggle } do
{
	_array = _vehicle getVariable "boost";
	_array set [1,(_array select 1) + (1 / _maxtime)];
	_vehicle setVariable ["boost",_array,true];
	sleep 0.1;
	hint format["Nitro %1%2",floor(_array select 1),"%"];

};

_array = _vehicle getVariable "boost";
hint format["Nitro %1%2",floor(_array select 1),"%"];