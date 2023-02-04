function draw_healthbar() {
	draw_healthbar(
		HEALTH_BAR_X1, HEALTH_BAR_Y1,
		HEALTH_BAR_X2, HEALTH_BAR_Y2,
		_health, 
		c_black, c_red, c_red, 
		0, true, true
	)
	draw_healthbar(
		STAMINA_BAR_X1, STAMINA_BAR_Y1,
		STAMINA_BAR_X2, STAMINA_BAR_Y2,
		_stamina, 
		c_black, c_yellow, c_yellow, 
		0, true, true
	)
	if (_stamina_lock == true) {
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
		draw_text_color(
			STAMINA_BAR_X1, 
			STAMINA_BAR_Y1 + BAR_HEIGHT + BAR_MARGIN, 
			"EXAHUSTED!",	
			c_green, c_green, c_green, c_green, 
			1
		)
	}
} 

function draw_ui_debug() {
	draw_healthbar(
		obj_player.x - 15, obj_player.y + 20, obj_player.x + 15, obj_player.y+ 25, 
		_heal_counter, 
		c_black, c_white, c_red, 
		0, false, false
	)
	draw_text_color(
		100, 200, 
		_speed, 
		c_green, c_green, c_green, c_green, 
		1
	)
	draw_text_color(
		50, 200,
		_healing_pack,
		c_blue, c_blue, c_blue, c_blue,
		1
	)
	draw_text_color(
		150, 200,
		global._attack_damage,
		c_red, c_red, c_red, c_red,
		1
	)
}

