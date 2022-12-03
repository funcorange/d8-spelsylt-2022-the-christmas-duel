/// @description Game Manager GUI drawing
draw_text(8, 8, "time: " + string(global.time) + ", fps: " + string(1 / global.deltaTime));
if (instance_exists(global.camera))
	draw_text(8, 32, "camera.x = " + string(global.camera.x) + ", camera.y = " + string(global.camera.y));
