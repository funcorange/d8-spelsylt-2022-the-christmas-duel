function Deccelerate(xDecceleration, yDecceleration)
{
	var _deltaTime = global.deltaTime;
	var _deccelX = xDecceleration * _deltaTime;
	var _deccelY = yDecceleration * _deltaTime;
	var _oldXVelocity = xVelocity;
	var _oldYVelocity = yVelocity;
	
	// Apply decceleration
	xVelocity += _deccelX;
	yVelocity += _deccelY;
	
	// Clamp decceleration
	var _velocityDotProduct = xVelocity * _oldXVelocity + yVelocity * _oldYVelocity;
	if (_velocityDotProduct < 0)
	{
		xVelocity = 0;
		yVelocity = 0;
	}
}
