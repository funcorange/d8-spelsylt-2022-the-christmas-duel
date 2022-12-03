/// @description Camera step

var _deltaTime = global.deltaTime;

// Calculate camera variables
var _camera = view_get_camera(0);
var _aspect = view_get_wport(0) / view_get_hport(0);

var _cameraHeight =	cameraHeight;
var _cameraWidth =	_cameraHeight * _aspect;

#region Movement

var _targetX = x;
var _targetY = y;
var _player = global.player;

// Get player position
if (instance_exists(_player))
{
	_targetX = _player.x - _cameraWidth / 2;
	_targetY = _player.y - _cameraHeight / 2;
}

// Calculate camera offset
var _normalisedMousePositionX = 2 * window_mouse_get_x() / window_get_width() - 1;
var _normalisedMousePositionY = 2 * window_mouse_get_y() / window_get_height() - 1;
var _viewWidth = 6 * _cameraWidth / 8;
var _viewHeight = 6 * _cameraHeight / 8;
_targetX += _normalisedMousePositionX * _viewWidth / 2;
_targetY += _normalisedMousePositionY * _viewHeight / 2;

var _xDist = _targetX - x;
var _yDist = _targetY - y;

// Move camera towards target
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
