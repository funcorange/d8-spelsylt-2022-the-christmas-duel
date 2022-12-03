function ShouldCollide(_other)
{
	if (!instance_exists(_other))
		return false;
	
	if (_other == owner)
		return false;
	
	if (collideWithCover && _other.isCover)
		return true;
	
	if (collideWithCharacter && _other.isCharacter)	
		return true;
	
	return false;
}