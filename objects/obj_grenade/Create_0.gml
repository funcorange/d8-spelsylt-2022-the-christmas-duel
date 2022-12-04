/// @description Grenade creation
event_inherited();

collisionFunction = function(_other)
{
	if (!ShouldCollide(_other))
		return;
	
	instance_destroy(self, true);
}
