function TakeDamage(_amount)
{
	if (!takeDamage)
		return;
	
	var _time = global.time;
	
	hp -= _amount;
	lastDamageTime = _time;
	
	if (hp <= 0 && !dead)
		dead = true;
}