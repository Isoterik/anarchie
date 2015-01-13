/*
 Will be revised later
*/
if((damage player) < 0.25) exitWith {};
if(!("FirstAidKit" in (items player))) exitWith {};
player removeItem "FirstAidKit";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;

if(playerSide == WEST)then
{
 	player setDamage 0; //Heal to 100 Cop
}else{
player setDamage 0.25; //Heal to 75};