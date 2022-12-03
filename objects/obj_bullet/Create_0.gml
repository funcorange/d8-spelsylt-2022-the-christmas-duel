/// @description Bullet creation
collisionFunction = function(_other)
{
	if (!ShouldCollide(_other))
		return;
	
	show_debug_message("Bullet collided with " + object_get_name(_other.object_index));
	
	with (_other)
		TakeDamage(1);
	
	instance_destroy(self, true);
}
