/// @description Grenade step

var _time = global.time;

if (_time > deathTime)
{
	var _explosion = instance_create_layer(x, y, "Bullets", obj_explosion);
	_explosion.owner = owner;
	_explosion.explosionDamage = 25;
	_explosion.explosionRadius = 272;
	
	instance_destroy(self, true);
}

Move();
