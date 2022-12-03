/// @description Minigun step

var _time = global.time;

if (firing)
{
	
	if (!wasFiring)
	{
		startFireTime = _time;
		wasFiring = true;
	}
	
	if (_time < startFireTime + spinUpTime)
	{
		var _timeSinceStartedFiring = _time - startFireTime;
		moveSpeedScale = spinUpMoveScale + (1- spinUpMoveScale) * (1 - _timeSinceStartedFiring / spinUpTime);
	}
	else
	{
		moveSpeedScale = spinUpMoveScale;
		
		if (_time > nextFireTime)
		{
			var _bullet = instance_create_layer(x, y, "Bullets", obj_bullet);
			var _bulletSpeed = 2048 * random_range(1.05, 0.95);
			var _bulletDirection = image_angle + random_range(-2.5, 2.5);
	
			_bullet.image_angle = _bulletDirection;
			_bullet.xVelocity = lengthdir_x(_bulletSpeed, _bulletDirection);
			_bullet.yVelocity = lengthdir_y(_bulletSpeed, _bulletDirection);
			_bullet.deathTime = _time + 1;
			_bullet.owner = owner;
	
			nextFireTime = _time + 0.05;
		}
	}
}
else
{
	if (wasFiring)
	{
		startFireTime = _time;
		wasFiring = false;
	}
	
	var _timeSinceStoppedFiring = _time - startFireTime;
	if (_timeSinceStoppedFiring < slowTime)
	{
		moveSpeedScale = spinUpMoveScale + (1 - spinUpMoveScale) * _timeSinceStoppedFiring / slowTime;
	}
	else
	{
		moveSpeedScale = 1;
	}
}



