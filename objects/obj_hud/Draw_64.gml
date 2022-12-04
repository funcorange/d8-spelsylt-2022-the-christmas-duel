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
		break;
	}
	
	case hudState.HUD_STATE_WIN:
	{
		break;
	}
	
	case hudState.HUD_STATE_LOSE:
	{
		break;
	}
	
	default:
	{
		break;
	}
}
