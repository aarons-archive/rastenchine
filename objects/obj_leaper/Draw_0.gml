draw_self()

draw_circle_color(x, y, attack_radius, c_red, c_red, true)
draw_circle_color(x, y, chase_radius, c_orange, c_orange, true)
draw_circle_color(x, y, vision_radius, c_yellow, c_yellow, true)

draw_rectangle(
	bbox_left - 200, bbox_top - 200,
	bbox_right + 200, bbox_bottom + 200,
	true
)

draw_healthbar(
	bbox_left - 3, bbox_top - 8, 
	bbox_right + 3, bbox_top - 3, 
	_health, 
	c_black, c_red, c_red,
	0,
	true, false
)

draw_path(path, x, y, true)	
draw_text(attack_x, attack_y, "X")