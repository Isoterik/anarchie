private ["_vehicle","_array","_value","_speedcap","_boost","_maxtime","_percent","_speed","_msek","_math","_jump","_jumph","_checkspeed"];

if((vehicle player) == player)exitwith{};
if(driver (vehicle player) != player)exitwith{};
if(!(isTouchingGround vehicle player ))exitwith{};
if( !( (vehicle player) getVariable ["boost",[false]] select 0 ) )exitwith{};


ZCT_BoostToggle = true;
ZCT_jump = false;
_checkspeed = 0;
_vehicle = (vehicle player);

_array = _vehicle getVariable "boost";

_value = _array select 1; // Nitro Value
_speedcap = _array select 2; // Max speed
_boost = _array select 3; // Normalspeed and _boost % is Boost
_maxtime = _array select 4; // 100% Nitro is _maxtime sek Boost
_jump = _array select 5; // 100% Nitro is _maxtime sek Boost


while {_value > 0 && ZCT_BoostToggle} do
{

	_speed = speed _vehicle;
	if(_checkspeed > _speed)exitwith{};

	_checkspeed = _speed;


	if(_speed <= 10) exitwith{};

	_msek = _speed / 3.6;

	if(speed _vehicle < _speedcap)then{

		if (_speed < (_speedcap * 0.5)) then
		{

			_percent = ((_msek / 5000) * (_boost + 25));

		}else{

			if (_speed < (_speedcap * 0.7)) then
			{

				_percent = ((_msek / 10000) * (_boost + 25));

			}else{

				if (_speed < (_speedcap * 0.9)) then
				{

					_percent = ((_msek / 20000) * (_boost + 25));

				}else{

					_percent = ((_msek / 1000000) * (_boost + 25));

				};
			};
		};
	}else{

		_percent = ((_msek / 60000) * (_boost + 25));

	};

	_math = _msek + _percent;
	
	_jumph = 0;

	if(ZCT_jump && isTouchingGround _vehicle && getplayeruid player == "76561197973355773")then // Test
	{
		ZCT_jump = false;
		_jumph = _jump;
		_value = _value - (10 / _maxtime);
		_vehicle allowDamage false;

		[] spawn {

			sleep 1;
			waitUntil {isTouchingGround (vehicle player)};
			sleep 2;
			(vehicle player) allowDamage true;

		};

	};

	if(isTouchingGround _vehicle)then
	{
		_vehicle setVelocity [ _math * (sin (getdir _vehicle)), _math * (cos (getdir _vehicle)),_jumph];

		if(isOnRoad position _vehicle) then
		{
			addCamShake [_speed/200, 1, 10];
		}
		else
		{
			addCamShake [_speed/150, 1, 50];
		};
		
	};

	_value = _value - (1 / _maxtime);
	hint format["Nitro %1%2",floor _value,"%"];
	sleep 0.01;

};

_array = _vehicle getVariable "boost";
_array set [1,_value];
_vehicle setVariable ["boost",_array,true];


// [_vehicle] spawn ZCT_fnc_LoadBoost;

[_vehicle,_maxtime] spawn ZCT_fnc_LoadBoost;
