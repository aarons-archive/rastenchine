function draw_debug_values() {
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
	if room_light != undefined {
	draw_text_color(
		200, 200, 
		room_light[| eLight.Range], 
		c_green, c_green, c_green, c_green, 
		1
	)
	}
}
