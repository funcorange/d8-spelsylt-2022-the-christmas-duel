/// @description Shotgun step

var _time = global.time;

if (firing && _time > nextFireTime)
{
	
	var _bulletSpeed = 1024;
	var _bulletSpread = spreadAngle / shotCount;
	
	for (var _i = 0; _i < shotCount; _i++)
	{
		var _bullet = instance_create_layer(x, y, "Bullets", obj_bullet);
		var _bulletAngle = image_angle - spreadAngle / 2 + _i * spreadAngle / shotCount + random_range(-_bulletSpread / 2, _bulletSpread / 2);
	
		_bullet.image_angle = _bulletAngle;
		_bullet.xVelocity = lengthdir_x(_bulletSpeed, _bulletAngle);
		_bullet.yVelocity = lengthdir_y(_bulletSpeed, _bulletAngle);
		_bullet.deathTime = _time + 1;
	}
	
	nextFireTime = _time + 0.5;
}
