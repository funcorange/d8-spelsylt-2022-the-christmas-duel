#macro GUI_HEIGHT 480

function GetGuiScale()
{
	return view_get_hport(0) / GUI_HEIGHT;
}
