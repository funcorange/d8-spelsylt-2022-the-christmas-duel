/// @description Game Manager room start

// Center player
var _player = global.player;
if (instance_exists(_player))
{
	var _startX, _startY;
	
	if (instance_number(obj_player_start) > 0)
	{
		var _playerStart = instance_find(obj_player_start, 0)
		_startX = _playerStart.x;
		_startY = _playerStart.y;
	}
	else
	{
		_startX = room_width / 2 - 64;
		_startY = room_height / 2 - 64;
	}
	_player.x = _startX;
	_player.y = _startY;
}
