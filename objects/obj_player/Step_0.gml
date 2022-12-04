/// @description Player step

var _movementKeyCount = 4;

#region Input
if (!disableControl)
{
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

	// Sprint input
	if (keyboard_check_pressed(sprintKey))
		inSprint = true;
	else if (keyboard_check_released(sprintKey))
		inSprint = false;
}

#endregion

#region Movement
var _moveInputX = 0, _moveInputY = 0;	// Direction of movement input key presses

var _moveSpeed;
if (inSprint)
	_moveSpeed = sprintSpeed;
else
	_moveSpeed = walkSpeed;


if (instance_exists(weapon))
	_moveSpeed *= weapon.moveSpeedScale;

maxSpeed = _moveSpeed;

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


// Calculate normalised movement direction

var _moveDirX = 0;
var _moveDirY = 0;

var _moveInputLength = point_distance(0, 0, _moveInputX, _moveInputY);
if (_moveInputLength > 0)
{
	var _moveInputLengthReciprocal = 1 / _moveInputLength;
	_moveDirX = _moveInputX * _moveInputLengthReciprocal;
	_moveDirY = _moveInputY * _moveInputLengthReciprocal;
}

var _acceleration = walkSpeed * 8;
MoveCharacter(_moveDirX, _moveDirY, _acceleration, _acceleration);

#endregion

#region Weapon

if (instance_exists(weapon))
{
	weapon.x = x;
	weapon.y = y;
	
	var _aimDir = point_direction(weapon.x, weapon.y, mouse_x, mouse_y);
	weapon.image_angle = _aimDir;
	
	weapon.firing = inFire;
	
	weapon.aimX = mouse_x;
	weapon.aimY = mouse_y;
	
	if (mouse_x < x)
		weapon.image_yscale = -1;
	else
		weapon.image_yscale = 1;
}

#endregion
