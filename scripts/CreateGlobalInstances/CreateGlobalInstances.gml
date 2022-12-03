function CreateGlobalInstances()
{
	global.player = instance_create_layer(
		room_width / 2,
		room_height / 2,
		"Logic",
		obj_player
	);
	global.camera = instance_create_layer(32, 0, "Camera", obj_camera);
}
