event_inherited();
draw_self()

draw_circle_color(x, y, swipe_attack_radius, c_red, c_red, true)
draw_circle_color(x, y, charge_attack_radius, c_green, c_green, true)

draw_line_colour(
	x - sprite_width / 2, y, 
	x + sprite_width / 2, y, 
	c_white, c_white
)
draw_line_colour(
	x, y - sprite_height / 2, 
	x, y + sprite_height / 2, 
	c_white, c_white
)