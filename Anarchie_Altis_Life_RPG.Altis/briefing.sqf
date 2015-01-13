waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["Anarchie","Willkommen"];
player createDiarySubject ["serverrules","Regeln"];
player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["controls","Tastenbelegung"];
player createDiarySubject ["Fahrzeugwerke","Fahrzeugwerke"];
player createDiarySubject ["Fahrzeuginfo","Fahrzeuginfo"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/

	player createDiaryRecord ["Anarchie",
		[
			"Willkommen", 
				"
				Willkommen auf Anarchie Altis Life!<br/><br/>
				Mit diesem Server starten wir ein Experiment:<br/>
				Wir überlassen es den Spielern wie sie das Leben und Miteinander gestallten.<br/> 
				Es gibt KEINE Whitelisteslots und auch kein seitenlanges Regelwerk.<br/>
				Die Admins halten sich aus dem Spielgeschehen vollkommen herraus, außer es kommt zu einem der Punkte die unter Server Ban aufgeführt sind.<br/> 
			"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Regel", 
				"
				Es gibt keine Regeln im eigentlichen Sinne.<br/><br/>
				Die Spieler setzen sich ihre Regeln und Grenzen selbst.<br/>
				So entsteht eine Eigendynamik auf dem Server.<br/>
				IHR formt Anarchie Altis Life!<br/>
			"
		]
	];
		
	player createDiaryRecord ["serverrules",
		[
			"Server Ban", 
				"
				Folgendes Verhalten führt zu einem Ban bzw. Blacklist Eintrag:<br/><br/>
				- Cheaten, Glitchen, bewusstes Bugusen<br/>
				- Reallife Bedrohungen anderer Spieler<br/>
				Wir haben einen sehr strengen Mechanismus der den Geldfluss überwacht,<br/>
				bei Überschreitungen einer gewissen Differenz greift dieser sofort und ein Blacklist Eintrag ist die Folge!<br/>	
			"
		]
	];

		player createDiaryRecord ["controls",
		[
			"Tastenbelegung",
				"
				Die standart Interaktionstaste ist die LINKE Windowstaste<br/>
				Diese Kann unter Individueller Steuerung Aktion 10 auf die LINKE Strg Taste umbelegt werden<br/>
				Z: Öffnet das Spielerinventar<br/>
				T: Öffnet das Fahrzeuginventar<br/>
				U: Schließt Fahrzeuge Auf und Ab sowie die Türen an Häusern in eurem Besitz<br/>
				X: Handbremse
				Shift + G: Knock out (Kann nur von Zivilisten angewandt werden)<br/>
				Shift + H: Faustfeuerwaffe Holstern<br/>
				Shift: Nitro (Getunte Fahrzeuge)<br/>
				F: Sirene (AMOK Sicherheitsdienst und Notärzte)<br/>
				Shift + L: Blaulicht (AMOK Sicherheitsdienst und Notärzte) Warnlicht ATAC<br/>
				Shift + R: Festnehmen (AMOK Sicherheitsdienst)<br/>
			"
		]
	];

	player createDiaryRecord ["changelog",
		[
			"Official Change Log",
				"
				The official change log can be found on the BIS forums (search Altis Life RPG)
			"
		]
	];
	
	player createDiaryRecord ["changelog",
		[
			"Anarchie Change Log",
				"
				- Version 3.1.4 ist aktuell. <br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"Info",
				"
				Gewisse Fahrzeuge können NUR selbst gebaut werden!<br/>
				Die benötigten Teile können dort in euer seperates Inventar eingelagert werden und werden Neustart-übergreifend gespeichert. Es können aber nur Teile die zur Produktion erforderlich sind, eingelagert werden keine anderen<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"CH-49 Mohawk",
				"
				Reifen: 6<br/>
				Karosserieteile: 400<br/>
				Innenausstattung: 400<br/>
				Elektronikkabel: 420<br/>
				Glas: 200<br/>
				Öl: 150<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"Strider",
				"
				Reifen: 4<br/>
				Karosserieteile: 500<br/>
				Innenausstattung: 600<br/>
				Elektronikkabel: 450<br/>
				Glas: 300<br/>
				Öl: 200<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"HEMTT Box",
				"
				Reifen: 8<br/>
				Karosserieteile: 650<br/>
				Innenausstattung: 600<br/>
				Elektronikkabel: 480<br/>
				Glas: 150<br/>
				Öl: 180<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"HEMTT Fuel",
				"
				Reifen: 8<br/>
				Karosserieteile: 700<br/>
				Innenausstattung: 700<br/>
				Elektronikkabel: 500<br/>
				Glas: 180<br/>
				Öl: 400<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeugwerke",
		[
			"Tempest Device",
				"
				Reifen: 6<br/>
				Karosserieteile: 350<br/>
				Innenausstattung: 360<br/>
				Elektronikkabel: 220<br/>
				Glas: 100<br/>
				Öl: 100<br/>
			"
		]
	];

	player createDiaryRecord ["Fahrzeuginfo",
		[
			"Fahrzeuginfo",
				"
				Tanklaster können mit der Linken Windowstaste Flüssigkeiten (Öl und Milch zZ.) automatisch abbauen<br/>
				Der Tempest Device kann alle Rohstoffe bis auf Flüssigkeiten mit der Linken Windowstaste automatisch abbauen<br/>
			"
		]
	];