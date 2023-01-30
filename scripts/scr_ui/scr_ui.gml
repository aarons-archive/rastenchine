function draw_ui_healthbar() {
	var VIEW_WIDTH = camera_get_view_width(view_camera[0])
	var VIEW_HEIGHT = camera_get_view_height(view_camera[1])
	draw_healthbar(
		VIEW_WIDTH - 110, 10, VIEW_WIDTH - 10, 30, 
		_stamina, 
		c_black, c_red, c_yellow, 
		0, true, true
	)
	draw_healthbar(
		50, 50, 150, 100, 
		_health, 
		c_black, c_red, c_red, 
		0, true, true
	)
	draw_healthbar(
		obj_player.x - 15, obj_player.y + 20, obj_player.x + 15, obj_player.y+ 25, 
		_heal_counter, 
		c_black, c_white, c_red, 
		0, false, false
	)
	if (_stamina_lock == true) {
		draw_text_color(
			50, 170, 
			"EXAHUSTED!",	
			c_green, c_green, c_green, c_green, 
			1
		)
	}
} 

function draw_ui_debug() {
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

