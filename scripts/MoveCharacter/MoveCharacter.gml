// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MoveCharacter(_moveDirX, _moveDirY, _acceleration, _decceleration)
{
	var _speed = point_distance(0, 0, xVelocity, yVelocity);
	if ((_moveDirX * _moveDirX + _moveDirY * _moveDirY) > 0 && _speed < maxSpeed)
	{
		// Calculate movement vector
		var _moveX, _moveY;	// Final movement amount
		_moveX = _moveDirX * _acceleration;
		_moveY = _moveDirY * _acceleration;
	
		// Apply acceleration
		Accelerate(_moveX, _moveY);
	}
	else if (_speed > 0)
	{
		var _speedReciprocal = 1 / _speed;
	
		// Calculate decceleration amount
		var _deccelX = -xVelocity * _speedReciprocal * _decceleration;
		var _deccelY = -yVelocity * _speedReciprocal * _decceleration;
	
		// Apply decceleration
		Deccelerate(_deccelX, _deccelY);
	}

	// Move
	Move();
}