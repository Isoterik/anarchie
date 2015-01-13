enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

ZCT_BoostToggle = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.3.5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

[] execVM "HandBrake.sqf"; // Press X , This Drift xD
[] execVM "realWeather.sqf"; //RealWeather as the filename said.

//funkmeldungen ohne sprachausgabe:
0 fadeRadio 0;
StartProgress = true;