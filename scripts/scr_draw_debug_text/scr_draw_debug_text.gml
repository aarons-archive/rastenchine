function draw_debug_text() {

	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	
	var names = "Movement State \nSpeed: \nDirection: "
	var values = string(movement_state) + "\n" + string(_speed) + "\n" + string(_direction)
	
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
		UI_X1 + UI_MARGIN, 
		UI_Y2 - UI_MARGIN, 
		names, 
		c_white, c_white, c_white, c_white,
		1
	)
	draw_text_color(
		UI_X1 + UI_MARGIN + string_width(names), 
		UI_Y2 - UI_MARGIN,
		values,
		c_white, c_white, c_white, c_white,
		1
	)
}
