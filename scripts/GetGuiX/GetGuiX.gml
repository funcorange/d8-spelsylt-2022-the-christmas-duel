function GetGuiX(_x)
{
	var _guiXOffset = GetGuiXOffset();
	var _guiScale = GetGuiScale();
	
	return _guiXOffset + _x * _guiScale;
}