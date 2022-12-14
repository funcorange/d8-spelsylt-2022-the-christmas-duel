/// @description Player initialisation
event_inherited();

// Initialise instance variables
// Input variables
// Input states
inMovement[3]	= false;	// Down
inMovement[2]	= false;	// Left
inMovement[1]	= false;	// Up
inMovement[0]	= false;	// Right
inFire			= false;
inSprint		= false;

// Input keys
movementKeys[3] = ord("S")
movementKeys[2] = ord("A")
movementKeys[1] = ord("W")
movementKeys[0] = ord("D")
sprintKey		= vk_shift;

onTakeDamage = function()
{
	if (hp > 0)
		global.hud.playerHealthFraction = hp / 100;
	else
		global.hud.playerHealthFraction = 0;
	
	if (dead)
	{
		takeDamage = false;
		isCharacter = false;
		disableControl = true;
		global.hud.state = hudState.HUD_STATE_LOSE;
	}
}
