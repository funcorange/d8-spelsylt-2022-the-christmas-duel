/// @description HUD Draw GUI

var _guiScale = GetGuiScale();

switch (state)
{
	case hudState.HUD_STATE_WEAPON_SELECT:
	{
		var _selectText = "Choose your weapon:\n1. Minigun\n2. Shotgun\n3. Grenade Launcher";
		var _selectTextX = GetGuiX(240);
		var _selectTextY = GetGuiY(120);
		var _selectTextShadowX = GetGuiX(241);
		var _selectTextShadowY = GetGuiY(121);
		
		draw_set_color(c_black)
		draw_text_ext_transformed(
			_selectTextShadowX,
			_selectTextShadowY,
			_selectText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		draw_set_color(c_white);
		draw_text_ext_transformed(
			_selectTextX,
			_selectTextY,
			_selectText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		
		break;
	}
	
	case hudState.HUD_STATE_PLAYING:
	{
		var _healthBarHeight = 32;
		var _playerHealthBarWidth = 96;
		var _atnasHealthBarWidth = _playerHealthBarWidth * 3;
		
		var _playerHealthBarX1 = GetGuiX(8);
		var _playerHealthBarY1 = GetGuiY(480 - _healthBarHeight - 8);
		var _playerHealthBarX2 = GetGuiX(8 + _playerHealthBarWidth);
		var _playerHealthBarY2 = GetGuiY(480 - 8);
		
		var _atnasHealthBarX1 = GetGuiX(640 - 8 - _atnasHealthBarWidth);
		var _atnasHealthBarY1 = _playerHealthBarY1;
		var _atnasHealthBarX2 = GetGuiX(640 - 8);
		var _atnasHealthBarY2 = _playerHealthBarY2;
		
		draw_set_color(c_black);
		draw_rectangle(_playerHealthBarX1, _playerHealthBarY1, _playerHealthBarX2, _playerHealthBarY2, false);
		draw_rectangle(_atnasHealthBarX1, _atnasHealthBarY1, _atnasHealthBarX2, _atnasHealthBarY2, false);
		draw_set_color(c_white);
		
		if (playerHealthFraction > 0)
			draw_rectangle_color(
				_playerHealthBarX1,
				_playerHealthBarY1,
				_playerHealthBarX1 + (_playerHealthBarX2 - _playerHealthBarX1) * playerHealthFraction,
				_playerHealthBarY2,
				c_red,
				c_orange,
				c_orange,
				c_red,
				false
			);
		
		if (atnasHealthFraction > 0)
			draw_rectangle_color(
				_atnasHealthBarX1 + (_atnasHealthBarX2 - _atnasHealthBarX1) * (1 - atnasHealthFraction),
				_atnasHealthBarY1,
				_atnasHealthBarX2,
				_atnasHealthBarY2,
				c_orange,
				c_red,
				c_red,
				c_orange,
				false
			);
		
		var _texts = array_create(2);
		var _textXs = array_create(2);
		
		_texts[0] = "Santa";
		_texts[1] = "Atnas";
		
		_textXs[0] = GetGuiX(8);
		_textXs[1] = GetGuiX(640 - 8 - string_width(_texts[1]));
		
		var _textY = GetGuiY(480 - 16 - 12 - _healthBarHeight);
		
		for (var _i = 0; _i < 2; _i++)
		{
			draw_set_color(c_black)
			draw_text_ext_transformed(
				_textXs[_i] + _guiScale,
				_textY + _guiScale,
				_texts[_i],
				_guiScale * 8,
				_guiScale * 640,
				_guiScale,
				_guiScale,
				0
			);
			draw_set_color(c_white);
			draw_text_ext_transformed(
				_textXs[_i],
				_textY,
				_texts[_i],
				_guiScale * 8,
				_guiScale * 640,
				_guiScale,
				_guiScale,
				0
			);
		}
		
		break;
	}
	
	case hudState.HUD_STATE_WIN:
	{
		var _winText = "YOU WIN!"
		var _winTextX = GetGuiX(240);
		var _winTextY = GetGuiY(180);
		var _winTextShadowX = GetGuiX(241);
		var _winTextShadowY = GetGuiY(181);
		
		draw_set_color(c_black)
		draw_text_ext_transformed(
			_winTextShadowX,
			_winTextShadowY,
			_winText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		draw_set_color(c_white);
		draw_text_ext_transformed(
			_winTextX,
			_winTextY,
			_winText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		
		break;
	}
	
	case hudState.HUD_STATE_LOSE:
	{
		var _loseText = "YOU LOSE!"
		var _loseTextX = GetGuiX(240);
		var _loseTextY = GetGuiY(180);
		var _loseTextShadowX = GetGuiX(241);
		var _loseTextShadowY = GetGuiY(181);
		
		draw_set_color(c_black)
		draw_text_ext_transformed(
			_loseTextShadowX,
			_loseTextShadowY,
			_loseText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		draw_set_color(c_white);
		draw_text_ext_transformed(
			_loseTextX,
			_loseTextY,
			_loseText,
			_guiScale * 8,
			_guiScale * 640,
			_guiScale,
			_guiScale,
			0
		);
		
		break;
	}
	
	default:
	{
		break;
	}
}
