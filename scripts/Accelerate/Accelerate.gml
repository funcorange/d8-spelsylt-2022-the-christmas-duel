function Accelerate(xAcceleration, yAcceleration)
{
	var _deltaTime = global.deltaTime;
	
	// Add acceleration
	xVelocity += xAcceleration * _deltaTime;
	yVelocity += yAcceleration * _deltaTime;
	
	// Clamp velocity
	var _speed = point_distance(0, 0, xVelocity, yVelocity);
	if (_speed > maxSpeed)
	{
		var _speedReciprocal = 1 / _speed;
		xVelocity = xVelocity * _speedReciprocal * maxSpeed;
		yVelocity = yVelocity * _speedReciprocal * maxSpeed;
	}
}
