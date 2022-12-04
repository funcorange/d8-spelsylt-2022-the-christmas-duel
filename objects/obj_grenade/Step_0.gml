/// @description Grenade step

var _time = global.time;

if (_time > deathTime)
{
	instance_destroy(self, true);
}

Move();
