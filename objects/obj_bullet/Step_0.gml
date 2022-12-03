/// @description Bullet step

var _time = global.time;

// Movement
Move();

// Bullet decay
if (_time > deathTime)
	instance_destroy(self, true);
