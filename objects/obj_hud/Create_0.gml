/// @description HUD creation

enum hudState
{
	HUD_STATE_NONE = 0,
	HUD_STATE_WEAPON_SELECT,
	HUD_STATE_PLAYING,
	HUD_STATE_WIN,
	HUD_STATE_LOSE
}

state = hudState.HUD_STATE_WEAPON_SELECT;
