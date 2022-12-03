/// @description Atnas step

// Follow player
var _targetX;
var _targetY;
var _targetGoalDistance = 512;
var _player = global.player;

if (instance_exists(_player))
{
	_targetX = _player.x;
	_targetY = _player.y;
}
else
{
	_targetX = x;
	_targetY = y;
}

var _distanceFromTarget = point_distance(x, y, _targetX, _targetY);
var _moveDirX = 0, _moveDirY = 0;
if (_distanceFromTarget > _targetGoalDistance)
{
	var _dx = _targetX - x;
	var _dy = _targetY - y;
	var _distanceReciprocal = 1 / _distanceFromTarget;
	_moveDirX = _dx * _distanceReciprocal;
	_moveDirY = _dy * _distanceReciprocal;
}

var _moveSpeed = 512;
if (instance_exists(weapon))
	_moveSpeed *= weapon.moveSpeedScale;

maxSpeed = _moveSpeed;

var _acceleration = 512 * 8;
MoveCharacter(_moveDirX, _moveDirY, _acceleration, _acceleration);
