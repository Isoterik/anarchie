
private["_unit","_oldpos","_olddir","_obj"];

if(isnil "block_player")then
{

	_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;


	if(player == _unit)exitwith{};


	player setpos (getMarkerPos  "block_spawn");
	player setdir (Markerdir  "block_spawn");

	block_cam = "CAMERA" camCreate getPos player;  
	showCinemaBorder false;  
	block_cam cameraEffect ["Internal", "Back"];  
	block_cam camSetTarget [14088.4,11555.8,1.70116825];  
	block_cam camSetPos [14091.4,11555.9,2.00116825];  
	block_cam camSetFOV .48;  
	block_cam camSetFocus [50, 0];  
	block_cam camCommit 0;

	titleText["Ein Admin hat dich Verbannt","PLAIN"];

	_obj = createVehicle ["Land_ClutterCutter_small_F", (getPosATL player), [], 0, "CAN_COLLIDE"];
	_obj setdir (getdir player);
	player attachTo [_obj,[0,0,0]];

	player enablesimulation false;
	disableUserInput true;

	block_player = true;
	[[player,true],"life_fnc_blackList",false,false] spawn life_fnc_MP;

}else{

	player enablesimulation true;
	disableUserInput false;
	detach player;

	block_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy block_cam;

	player setpos (getMarkerPos  "civ_spawn_1");
	player setdir (MarkerDir  "civ_spawn_1");

	block_player = nil;
	[[player,false],"life_fnc_blackList",false,false] spawn life_fnc_MP;

};