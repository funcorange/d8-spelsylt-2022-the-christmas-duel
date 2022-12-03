/// @description Player step

var _movementKeyCount = 4;

#region Input
// Movement input
for (var _i = 0; _i < _movementKeyCount; _i++)
{
	if (keyboard_check_pressed(movementKeys[_i]))
		inMovement[_i] = true;
	else if (keyboard_check_released(movementKeys[_i]))
		inMovement[_i] = false;
}
	
// Fire input
if (mouse_check_button_pressed(mb_left))
	inFire = true;
else if (mouse_check_button_released(mb_left))
	inFire = false;

#endregion

#region Movement
var _moveInputX = 0, _moveInputY = 0;	// Direction of movement input key presses

// Check movement input
for (var _i = 0; _i < _movementKeyCount; _i++)
{
	if (inMovement[_i])
	{
		// Add movement direction for this input
		_moveInputX += cos(_i * pi / 2);
		_moveInputY -= sin(_i * pi / 2);	// Positive y is down
	}
}

var _moveInputLength = point_distance(0, 0, _moveInputX, _moveInputY);
if (_moveInputLength > 0)
{
	// Calculate normalised movement direction
	var _moveInputLengthReciprocal = 1 / _moveInputLength;
	
	var _moveDirX, _moveDirY;
	_moveDirX = _moveInputX * _moveInputLengthReciprocal;
	_moveDirY = _moveInputY * _moveInputLengthReciprocal;
	
	// Calculate movement vector
	var _moveX, _moveY;	// Final movement amount
	var _acceleration = 8 * maxSpeed; // Amount to accelerate
	_moveX = _moveDirX * _acceleration;
	_moveY = _moveDirY * _acceleration;
	
	// Apply acceleration
	Accelerate(_moveX, _moveY);
}
else
{
	var _speed = point_distance(0, 0, xVelocity, yVelocity);
	if (_speed > 0)
	{
		var _speedReciprocal = 1 / _speed;
	
		// Calculate decceleration amount
		var _decceleration = 8 * maxSpeed;
		var _deccelX = -xVelocity * _speedReciprocal * _decceleration;
		var _deccelY = -yVelocity * _speedReciprocal * _decceleration;
	
		// Apply decceleration
		Deccelerate(_deccelX, _deccelY);
	}
}

// Move
Move();

#endregion