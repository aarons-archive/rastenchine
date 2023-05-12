event_inherited()

if (global.debug_enemies == true) {
	draw_rectangle_color(
		bbox_left - attack_radius, bbox_top, 
		bbox_right + attack_radius, bbox_bottom, 
		c_red, c_red, c_red, c_red, 
		true
	)
}