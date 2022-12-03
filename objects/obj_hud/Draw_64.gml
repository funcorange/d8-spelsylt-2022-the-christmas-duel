/// @description HUD Draw GUI

var _guiScale = GetGuiScale();

// Draw player health bar
var _healthWidth = 96;
var _healthHeight = 32;
var _healthX = 8;
var _healthY = (480 - 8 - _healthHeight);
draw_set_color(c_black);
draw_rectangle(
	_healthX * _guiScale,
	_healthY * _guiScale,
	(_healthX + _healthWidth) * _guiScale,
	(_healthY + _healthHeight) * _guiScale,
	false
);
draw_set_color(c_white);
