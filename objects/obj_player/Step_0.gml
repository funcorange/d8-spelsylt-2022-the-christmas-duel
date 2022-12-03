/// @description Player step

// Movement
var moveX = 0, moveY = 0;
var movementKeyCount = array_length(movementKeys);

// Check pressed movement keys
for (var i = 0; i < movementKeyCount; i++)
{
	if (keyboard_check(movementKeys[i]))
	{
		// Add movement direction for this key
		moveX += cos(i * pi / 2);
		moveY -= sin(i * pi / 2);	// Positive y is down
	}
}

// Move
x += moveX;
y += moveY;
