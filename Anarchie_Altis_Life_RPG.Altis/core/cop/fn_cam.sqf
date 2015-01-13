
cam_on = false;

switch (_this select 3) do
{

	case "markt":
	{
		cam_cam = "CAMERA" camCreate getPos player;
		showCinemaBorder false;
		cam_cam cameraEffect ["Internal", "Back"];
		cam_cam camSetPos [3625.9,13143.8,14.1014];
		cam_cam camSetTarget [3643.41,13112.6,0.0014143];
		cam_cam camSetFOV 1;
		cam_cam camSetFocus [0, 0];
		cam_cam camCommit 0;
		cam_on = true;
		waitUntil {!cam_on};
	};


	case "bank":
	{
		cam_cam = "CAMERA" camCreate getPos player;
		showCinemaBorder false;
		cam_cam cameraEffect ["Internal", "Back"];
		cam_cam camSetPos [17319.5,13187.5,30.00143051];
		cam_cam camSetTarget [17379.3,13173.6,0.898232];
		cam_cam camSetFOV 1;
		cam_cam camSetFocus [0, 0];
		cam_cam camCommit 0;
		cam_on = true;
		waitUntil {!cam_on};
	};

	case "jail":  
	{
		cam_cam = "CAMERA" camCreate getPos player;
		showCinemaBorder false;
		cam_cam cameraEffect ["Internal", "Back"];
		cam_cam camSetPos [13607.1,12188.2,14.00143909];
		cam_cam camSetTarget [13593.4,12190.1,0.00152874];
		cam_cam camSetFOV 1;
		cam_cam camSetFocus [0, 0];
		cam_cam camCommit 0;
		cam_on = true;
		waitUntil {!cam_on};

	};

	case "aga":
	{
		cam_cam = "CAMERA" camCreate getPos player;
		showCinemaBorder false;
		cam_cam cameraEffect ["Internal", "Back"];
		cam_cam camSetPos [15624.8,11097.5,24.00143814];
		cam_cam camSetTarget [15495.8,11185.5,0.00142288];
		cam_cam camSetFOV 1;
		cam_cam camSetFocus [0, 0];
		cam_cam camCommit 0;
		cam_on = true;
		waitUntil {!cam_on};
	};

	case "air":
	{
		cam_cam = "CAMERA" camCreate getPos player;
		showCinemaBorder false;
		cam_cam cameraEffect ["Internal", "Back"];
		cam_cam camSetPos [14535.7,16710.9,7.97379];
		cam_cam camSetTarget [14679.9,16743.3,0.00143814];
		cam_cam camSetFOV 1;
		cam_cam camSetFocus [0, 0];
		cam_cam camCommit 0;
		cam_on = true;
		waitUntil {!cam_on};
	};
};

cam_cam cameraEffect ["TERMINATE","BACK"];
camDestroy cam_cam;