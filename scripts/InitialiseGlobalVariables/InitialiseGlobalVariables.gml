/// @func	InitGlobalVars()
/// @desc	Initialises global variables
function InitialiseGlobalVariables()
{
	// Game
	global.player = instance_create_layer(
		room_width / 2,
		room_height / 2,
		"Logic",
		obj_player
	);
	global.camera = instance_create_layer(32, 0, "Logic", obj_camera);
	
	// Time
	global.time				= 0;
	global.realTime			= 0;
	global.deltaTime		= 0;
	global.realDeltaTime	= 0;
}
