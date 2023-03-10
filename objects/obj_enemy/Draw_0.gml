draw_circle_color(x, y,100, c_red,c_red,true)
draw_circle_color(x, y, vision_radius, c_green, c_blue, true)
draw_circle_color(x, y, agro_radius, c_green, c_green, true)

draw_healthbar(x - 34, y - 40, x + 34, y - 35, _health, c_black, c_red, c_red, 0, false, false)

if (keyboard_check(global.SHOW_ENEMY_PATH_KEY)) {
	draw_path(path, x, y, 0)	
}