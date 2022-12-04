/// @description Game step

// Update time
var _realDeltaTime = delta_time / 1000000;
var _deltaTime = _realDeltaTime;
global.realDeltaTime = _realDeltaTime;
global.deltaTime = _deltaTime;
global.time += global.deltaTime;
global.realTime += global.realDeltaTime;

if (!weaponSelected)
{
	var _selectedWeapon = 0;
	
	if (keyboard_check_pressed(ord("1")))
	{
		weaponSelected = true;
		_selectedWeapon = 0;
	}
	else if (keyboard_check_pressed(ord("2")))
	{
		weaponSelected = true;
		_selectedWeapon = 1;
	}
	else if (keyboard_check_pressed(ord("3")))
	{
		weaponSelected = true;
		_selectedWeapon = 2;
	}
	
	if (weaponSelected)
	{
		global.player.disableControl = false;
		global.hud.state = hudState.HUD_STATE_PLAYING;
		
		var _atnasStartX, _atnasStartY;
		var _atnasStart = instance_find(obj_atnas_start, 0);
		if (_atnasStart != noone)
		{
			_atnasStartX = _atnasStart.x;
			_atnasStartY = _atnasStart.y;
		}
		else
		{
			_atnasStartX = room_width / 2;
			_atnasStartY = room_width / 2;
		}
		
		
		var _atnas = instance_create_layer(_atnasStartX, _atnasStartY, "Atnas", obj_atnas);
		var _atnasWeapon;
		var _playerWeapon;
		if (_selectedWeapon == 0)
		{
			_atnasWeapon = instance_create_layer(_atnas.x, _atnas.y, "Weapons", obj_grenade_launcher);
			_playerWeapon = instance_create_layer(global.player.x, global.player.y, "Weapons", obj_minigun);
		}
		else if (_selectedWeapon == 1)
		{
			_atnasWeapon = instance_create_layer(_atnas.x, _atnas.y, "Weapons", obj_minigun);
			_playerWeapon = instance_create_layer(global.player.x, global.player.y, "Weapons", obj_shotgun);
		}
		else if (_selectedWeapon == 2)
		{
			_atnasWeapon = instance_create_layer(_atnas.x, _atnas.y, "Weapons", obj_shotgun);
			_playerWeapon = instance_create_layer(global.player.x, global.player.y, "Weapons", obj_grenade_launcher);
		}
		_atnasWeapon.owner = _atnas;
		_atnas.weapon = _atnasWeapon;
		_playerWeapon.owner = global.player;
		global.player.weapon = _playerWeapon;
	}
}
