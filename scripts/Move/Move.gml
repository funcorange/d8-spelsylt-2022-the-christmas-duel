function Move()
{
	var _deltaTime = global.deltaTime;
	x += xVelocity * _deltaTime;
	y += yVelocity * _deltaTime;
}