/// @description Atnas step

var _time = global.time;

var _aimX = 0;
var _aimY = 0;

if (!dead)
{	
	// Follow player
	var _targetX;
	var _targetY;
	var _targetGoalDistance = 512;
	var _player = global.player;

	if (instance_exists(_player))
	{
		_targetX = _player.x;
		_targetY = _player.y;
		_aimX = _player.x;
		_aimY = _player.y;
	}
	else
	{
		_targetX = x;
		_targetY = y;
	}

	var _distanceFromTarget = point_distance(x, y, _targetX, _targetY);
	
	var _minDistance, _maxDistance;
	if (instance_exists(weapon))
	{
		_minDistance = weapon.minDistance;
		_maxDistance = weapon.maxDistance;
	}
	else
	{
		_minDistance = 256;
		_maxDistance = 512;
	}
	
#region Chase AI
	if (!chase && _distanceFromTarget > _maxDistance)
		chase = true;
	
	if (chase && _distanceFromTarget < _minDistance)
		chase = false;
		
	if (chase)
		_targetGoalDistance = _minDistance;
	else
		_targetGoalDistance = _maxDistance;
#endregion
	
#region Movement
	var _moveDirX = 0, _moveDirY = 0;
	if (_distanceFromTarget > _targetGoalDistance)
	{
		var _dx = _targetX - x;
		var _dy = _targetY - y;
		var _distanceReciprocal = 1 / _distanceFromTarget;
		_moveDirX = _dx * _distanceReciprocal;
		_moveDirY = _dy * _distanceReciprocal;
	}

	var _moveSpeed = 384;
	if (instance_exists(weapon))
		_moveSpeed *= weapon.moveSpeedScale;

	maxSpeed = _moveSpeed;

	var _acceleration = 512 * 8;
#endregion

#region Dodge bullet AI
	var _bulletCount = instance_number(obj_bullet);
	for (var _i = 0; _i < _bulletCount; _i++)
	{
		var _bullet = instance_find(obj_bullet, _i);
		if (_bullet.owner == id)
			continue;
		
		var _bulletDistance = point_distance(x, y, _bullet.x, _bullet.y);
		var _bulletScale;
		if (_bulletDistance < 100)
			_bulletScale = 100;
		else
			_bulletScale = 100 / _bulletDistance;
		
		var _bulletDir = point_direction(x, y, _bullet.x, _bullet.y);
		
		_moveDirX -= lengthdir_x(_bulletScale, _bulletDir);
		_moveDirY -= lengthdir_y(_bulletScale, _bulletDir);
	}
	
	var _grenadeCount = instance_number(obj_grenade);
	for (var _i = 0; _i < _grenadeCount; _i++)
	{
		var _grenade = instance_find(obj_grenade, _i);
		if (_grenade.owner == id)
			continue;
		
		var _grenadeDistance = point_distance(x, y, _grenade.x, _grenade.y);
		var _grenadeScale;
		if (_grenadeDistance < 600)
			_grenadeScale = 600;
		else
			_grenadeScale = 600 / _grenadeDistance;
		
		var _grenadeDir = point_direction(x, y, _grenade.x, _grenade.y);
		
		_moveDirX -= lengthdir_x(_grenadeScale, _grenadeDir);
		_moveDirY -= lengthdir_y(_grenadeScale, _grenadeDir);
	}
#endregion

	MoveCharacter(_moveDirX, _moveDirY, _acceleration, _acceleration);
}
else
{
	if (takeDamage)
		takeDamage = false;
	
	if (isCharacter)
		isCharacter = false;
}

#region Damage Flash

if (lastDamageTime >= 0 && _time < (lastDamageTime + damageFlashDuration))
{
	var _amount = (_time - lastDamageTime) / damageFlashDuration;
	var _colour = make_colour_rgb(255, 255 * _amount, 255 * _amount);
	image_blend = _colour;
}
else
{
	image_blend = c_white;
}

#endregion

#region Weapon

if (instance_exists(weapon))
{
	var _minDistance = weapon.minDistance;
	var _maxDistance = weapon.maxDistance;
	
	weapon.x = x;
	weapon.y = y;
	weapon.aimX = _aimX;
	weapon.aimY = _aimY;
	
	if (!dead)
	{
		weapon.image_angle = point_direction(x, y, _aimX, _aimY);
		
		if (_aimX < x)
			weapon.image_yscale = -1;
		else
			weapon.image_yscale = 1;
		
		var _aimDistance = point_distance(x, y, _aimX, _aimY);
		
		if (_aimDistance < _maxDistance)
			weapon.firing = true;
		else
			weapon.firing = false;
	}
	else
	{
		weapon.firing = false;
	}
}

#endregion
