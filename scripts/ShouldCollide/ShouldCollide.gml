function ShouldCollide(_other)
{
	if (collideWithCover && _other.isCover)
		return true;
	
	return false;
}