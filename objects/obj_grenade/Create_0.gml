/// @description Grenade creation
event_inherited();

collisionFunction = function(_other)
{
	if (!ShouldCollide(_other))
		return;
	
	var _explosion = instance_create_layer(x, y, "Bullets", obj_explosion);
	_explosion.owner = owner;
	_explosion.explosionDamage = 15;
	_explosion.explosionRadius = 272;
	
	instance_destroy(self, true);
}
