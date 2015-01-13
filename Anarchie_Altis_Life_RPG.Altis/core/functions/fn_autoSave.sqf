/*
    @Version: 0.2
    @Author: =IFD= Cryptonat
    @Edited: 4/4/14
    
    Description:
    Saves the player's gear every 10 minutes.
*/

//edited by preller. removed case for police.
while {true} do {
    sleep 600;
    [] call SOCK_fnc_updateRequest;
    hint "Automatisches Speichern...";
}; 