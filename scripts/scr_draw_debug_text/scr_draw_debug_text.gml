function draw_debug_text() {

	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	
	draw_text_colour(
		HEALTH_BAR_BG_X1 - UI_MARGIN, 
		HEALTH_BAR_MIDDLE,
		string(_health) + "/" + string(PLAYER_MAX_HEALTH), 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_colour(
		STAMINA_BAR_BG_X1 - UI_MARGIN, 
		STAMINA_BAR_MIDDLE, 
		string(stamina) + "/" + string(PLAYER_MAX_STAMINA), 
		c_white, c_white, c_white, c_white,
		1
	)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	
	var names = "Speed: "
	var values = string(_speed)
	
	var item = inventory.item
	if (is_instanceof(item, Weapon)) {
		names += "\nState: \nDamage: "
		values += "\n" + string(item.state) + "\n" + string(item.damage)
 	}
	if (is_instanceof(item, Crowbar)) {
		names += "\nCharge: "
		values += "\n" + string(item.charge)
	}
	else if (is_instanceof(item, Gun)) {
		names += "\nAmmo: \nClip: "
		values += "\n" + string(item.ammo) + "\n" + string(item.clip)
	}
		
	draw_text_color( 
		UI_X1, UI_Y2, 
		names, 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color(
		UI_X1 + string_width(names), UI_Y2, 
		values,
		c_white, c_white, c_white, c_white,
		1
	)
}
