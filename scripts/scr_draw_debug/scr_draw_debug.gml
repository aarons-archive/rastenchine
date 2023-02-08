function draw_debug() {

	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	
	draw_text_colour(
		HEALTH_BAR_BG_X1 - UI_MARGIN, 
		HEALTH_BAR_MIDDLE,
		string(_health) + "/" + string(MAX_HEALTH), 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_colour(
		STAMINA_BAR_BG_X1 - UI_MARGIN, 
		STAMINA_BAR_MIDDLE, 
		string(_stamina) + "/" + string(MAX_STAMINA), 
		c_white, c_white, c_white, c_white,
		1
	)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	var _names = "Speed: \nHealing Packs: "
	var _values = string(_speed) + "\n" + string(_healing_pack)
	draw_text_color(
		UI_X1, UI_Y1, 
		_names, 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color(
		UI_X1 + string_width(_names), UI_Y1, 
		_values,
		c_white, c_white, c_white, c_white,
		1
	)
}
