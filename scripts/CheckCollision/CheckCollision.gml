function CheckCollision(_testX, _testY)
{
	if (collideWithCover)
	{
		var _collisionInstance = instance_place(_testX, _testY, obj_base_cover);
		if (_collisionInstance != noone && ShouldCollide(_collisionInstance))
			return true;
	}
	if (collideWithCharacter)
	{
		var _collisionInstance = instance_place(_testX, _testY, obj_base_character);
		if (_collisionInstance != noone && ShouldCollide(_collisionInstance))
			return true;
	}
	
	return false;
}
