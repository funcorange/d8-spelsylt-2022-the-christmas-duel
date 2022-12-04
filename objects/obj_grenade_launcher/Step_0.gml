/// @description Grenade Launcher step

var _time = global.time;

if (firing && _time > nextFireTime)
{
	var _grenade = instance_create_layer(x, y, "Bullets", obj_grenade);
	
	var _grenadeSpeed = 768;
	var _grenadeDirection = image_angle;
	var _grenadeLife = point_distance(x, y, aimX, aimY) / _grenadeSpeed;
	
	_grenade.xVelocity = lengthdir_x(_grenadeSpeed, _grenadeDirection);
	_grenade.yVelocity = lengthdir_y(_grenadeSpeed, _grenadeDirection);
	_grenade.deathTime = _time + _grenadeLife;
	_grenade.owner = owner;
	_grenade.image_angle = image_angle;
	
	nextFireTime = _time + 1;
}
