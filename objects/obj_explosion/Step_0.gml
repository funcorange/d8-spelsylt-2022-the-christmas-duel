/// @description Explosion step

var _time = global.time;

if (!doneDamage)
{
	doneDamage = true;
	
	var _count = instance_number(obj_base);
	for (var _i = 0; _i < _count; _i++)
	{
		var _instance = instance_find(obj_base, _i);
		var _distance = point_distance(x, y, _instance.x, _instance.y);
		if (_distance > explosionRadius)
			continue;
		
		var _damage = explosionDamage;
		if (_instance == owner)
			explosionDamage /= 2;
		
		with (_instance) TakeDamage(_damage);
	}
}

if (_time > startTime + effectTime)
	instance_destroy(self, true);
