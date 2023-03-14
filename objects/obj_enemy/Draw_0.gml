draw_self()

draw_circle_color(x, y, attack_radius, c_red, c_red, true)
draw_circle_color(x, y, agro_radius, c_orange, c_orange, true)
draw_circle_color(x, y, vision_radius, c_yellow, c_yellow, true)

draw_healthbar(
	bbox_left - 3, bbox_top - 8, 
	bbox_right + 3, bbox_top - 3, 
	_health, 
	c_black, c_red, c_red,
	0,
	true, false
)

if (keyboard_check(global.SHOW_ENEMY_PATH_KEY)) {
	draw_path(path, x, y, 0)	
}