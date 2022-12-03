/// @description Camera step

var _deltaTime = global.deltaTime;

// Calculate camera variables
var _camera = view_get_camera(0);
var _aspect = window_get_width() / window_get_height();

var _cameraHeight =	cameraHeight;
var _cameraWidth =	_cameraHeight * _aspect;

#region Movement
// Update camera position
var _targetX = x;
var _targetY = y;
var _player = global.player;

if (instance_exists(_player))
{
	_targetX = _player.x + 64 - _cameraWidth / 2;
	_targetY = _player.y + 64 - _cameraHeight / 2;
}

var _xDist = _targetX - x;
var _yDist = _targetY - y;

// Move camera toweards target
if (abs(_xDist) > 0 && abs(_yDist) > 0)
{
	var _xVel = _xDist * 2;
	var _yVel = _yDist * 2;

	x += _xVel * _deltaTime;
	y += _yVel * _deltaTime;

	var _newXDist = _targetX - x;
	var _newYDist = _targetY - y;
	var _targetDot = _xDist * _newXDist + _yDist * _newYDist;
	if (_targetDot < 0 )
	{
		// Clamp position
		x = _targetX;
		y = _targetY;
	}
}

#endregion

// Update camera settings
camera_set_view_pos(_camera, x, y);
camera_set_view_size(_camera, _cameraWidth, _cameraHeight);
