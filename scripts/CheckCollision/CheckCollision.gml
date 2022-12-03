function CheckCollision(_testX, _testY)
{
	var _collisionInstance = instance_place(_testX, _testY, obj_base);
	if (_collisionInstance == noone)
		return false;
	
	if (ShouldCollide(_collisionInstance))
		return true;
	
	return false;
}
