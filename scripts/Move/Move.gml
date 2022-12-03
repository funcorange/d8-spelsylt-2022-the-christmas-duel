function Move()
{
	var _deltaTime = global.deltaTime;
	
	var _dx = xVelocity * _deltaTime;
	var _dy = yVelocity * _deltaTime;
	var _targetX = x;
	var _targetY = y;
	
	var _moveDistance = point_distance(0, 0, _dx, _dy);
	var _moveDirection = point_direction(0, 0, _dx, _dy);
	var _collisionStepLength = 1;
	var _collisionSteps = ceil(_moveDistance / _collisionStepLength);
	var _foundFree = false;
	
	for (var _step = 0; _step < _collisionSteps; _step++)
	{
		if (_foundFree)
			break;
		
		var _testX = x + _dx * (_step + 1) / _collisionSteps;
		var _testY = x + _dy * (_step + 1) / _collisionSteps;
		if ((_testX * _testX + _testY * _testY) > (_moveDistance * _moveDistance))
		{
			_testX = x + _dx;
			_testY = y + _dy;
		}
		
		if (CheckCollision(_testX, _testY))
		{
			var _maxSlideAngle = 89;
				
			for (var _angle = 5; _angle <= _maxSlideAngle; _angle += 5)
			{
				for (var _dir = -1; _dir <= 1; _dir += 2)
				{
					var _testDist = point_distance(_targetX, _targetY, _testX, _testY);
					var _testDir = _moveDirection + _dir * _angle;
					_testX = _targetX + lengthdir_x(_testDist, _testDir);
					_testY = _targetY + lengthdir_y(_testDist, _testDir);
						
					if (!CheckCollision(_testX, _testY))
					{
						_targetX = _testX;
						_targetY = _testY;
						_foundFree = true;
						break;
					}
				}
			}
				
			//var _subSteps = 8;
			//for (var _i = 0; _i < _subSteps; _i++)
			//{
			//	_testX = _targetX + (_testX - _targetX) / 2;
			//	_testY = _targetY + (_testY - _targetY) / 2;
			//	
			//	var _collisionInstance = instance_place(_testX, _testY, obj_base);
			//	if (_collisionInstance == noone || !_collisionInstance.isCover)
			//	{
			//		_targetX = _testX;
			//		_targetY = _testY;
			//		_foundFree = true;
			//		break;
			//	}
			//}
				
			break;
		}
		
		_targetX = _testX;
		_targetY = _testY;
	}
	
	x = _targetX;
	y = _targetY;
}