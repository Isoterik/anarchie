/*
	File: fn_markVictim.sqf
	Author: DJstone
	
	Description:
	Sets a Marker for the Victims position on a 911 call
*/
private["_position","_markerName"];
_position = _this select 0;
_markerName = _this select 1;

if(side player == west) then
{
	createMarkerLocal [_markerName, _position];
	_markerName setMarkerColorLocal "ColorBlack";
	_markerName setMarkerTextLocal "! AMOK NOTRUF !";
	_markerName setMarkerTypeLocal "mil_warning";

	sleep 90;
	deleteMarkerLocal _markerName;
};

if(side player == east) then
{
	createMarkerLocal [_markerName, _position];
	_markerName setMarkerColorLocal "ColorBlack";
	_markerName setMarkerTextLocal "! ATAC NOTRUF !";
	_markerName setMarkerTypeLocal "mil_warning";

	sleep 90;
	deleteMarkerLocal _markerName;
};