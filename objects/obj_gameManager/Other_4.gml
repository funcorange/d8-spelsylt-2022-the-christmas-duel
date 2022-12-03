/// @description Game Manager room start

// Center player
var _player = global.player;
if (instance_exists(_player))
{
	_player.x = room_width / 2 - 64;
	_player.y = room_height / 2 - 64;
}
