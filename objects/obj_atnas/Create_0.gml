/// @description Atnas creation
event_inherited();

onTakeDamage = function()
{
	if (hp > 0)
		global.hud.atnasHealthFraction = hp / 300;
	else
		global.hud.atnasHealthFraction = 0;
	
	if (dead)
	{
		takeDamage = false;
		isCharacter = false;
		global.hud.state = hudState.HUD_STATE_WIN;
	}
}
