function GetGuiXOffset()
{
	var _windowWidth = window_get_width();
	var _windowHeight = window_get_height();
	var _guiWidth = _windowHeight * 4 / 3;
	var _guiXOffset = (_windowWidth - _guiWidth) / 2;
	
	return _guiXOffset;
}