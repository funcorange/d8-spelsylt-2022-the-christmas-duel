/// @description Player step

var _deltaTime = global.deltaTime;

// Movement
var _moveDirX = 0, _moveDirY = 0, _moveX = 0, _moveY = 0;
var _movementKeyCount = array_length(movementKeys);

// Check pressed movement keys
for (var _i = 0; _i < _movementKeyCount; _i++)
{
	if (keyboard_check(movementKeys[_i]))
	{
		// Add movement direction for this key
		_moveDirX += cos(_i * pi / 2);
		_moveDirY -= sin(_i * pi / 2);	// Positive y is down
	}
}

_moveX = _moveDirX * _deltaTime * 256;
_moveY = _moveDirY * _deltaTime * 256;

// Move
x += _moveX;
y += _moveY;
