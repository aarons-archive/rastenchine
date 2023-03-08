draw_rectangle_color(x-64, y-34,x+64,y+34, c_red,c_red,c_red, c_red, true)
draw_circle_color(x, y, _vision_radius, c_green, c_blue, true)
draw_circle_color(x, y, _agro_radius, c_green, c_green, true)

draw_healthbar(x, y - 16, x + 64, y - 5, _health, c_black, c_red, c_red, 0, false, false)

if (keyboard_check(global.SHOW_ENEMY_PATH_KEY)) {
	draw_path(path, x, y, 0)	
}