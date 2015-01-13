/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
private["_text1","_text2","_text3","_text4","_text5"];
	_text1 = parseText format["%1","<t color='#D7DF01'>Willkommen</t><br /><t shadow='true'>auf Anarchie Altis Life!</t><br />"];

_text2 = parseText format["%1","<t color='#0c00ff'>Spaß</t><br /><t shadow='true'>Wir wünschen dir viel Spaß!</t><br />"];

_text3 = parseText format["%1","<t color='#0dbf00'>Dein Weg</t><br /> <t shadow='true'>Tue dir keinen Zwang an, mache das worauf du Lust hast!.</t><br />"];

_text4 = parseText format["%1","<t color='#ff0000'>Wichtig</t><br /><t shadow='true'>Lese die Regeln!</t><br />"];

_text5 = parseText format["%1","<t color='#ff0000'>Server</t><br /> <t color='#ff4444'>Der Server hält sich selbstständig auf der aktuellen ArmA Version. Bei jedem Neustart um 0:00, 6:00, 12:00 und 18:00 Uhr wird die Version geprüft.</t><br />"];


format["Willkommen %1",name player] hintC [_text1,_text2,_text3,_text4,_text5];
	