/// @func	InitGlobalVars()
/// @desc	Initialises global variables
function InitialiseGlobalVariables()
{
	// Game
	global.player = noone;
	global.camera = noone;
	
	// Time
	global.time				= 0;
	global.realTime			= 0;
	global.deltaTime		= 0;
	global.realDeltaTime	= 0;
	
	CreateGlobalInstances();
}
