/// @description Bullet creation
collisionFunction = function(_other)
{
	if (!ShouldCollide(_other))
		return;
	
	show_debug_message("Bullet collided with " + object_get_name(_other.object_index));
	
	with (_other)
		TakeDamage(other.damage);
	
	instance_destroy(self, true);
}

image_blend = c_yellow;
