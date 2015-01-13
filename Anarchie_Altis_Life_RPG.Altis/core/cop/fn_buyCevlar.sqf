if(!life_cevlar)then
{
	if(life_cash < 200)exitwith{hint "Du hast keine $200"};

	life_cash = life_cash - 200;
	life_cevlar = true;
	[] call life_fnc_hudUpdate;
	hint "Du hast eine Kevlarweste angezogen.";
};
