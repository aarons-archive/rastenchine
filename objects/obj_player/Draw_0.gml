draw_self()
draw_weapon()

if (_x_movement > 1) {
	image_angle = 0
	image_yscale = 1
}
if (_x_movement < 0) {
	image_angle = 180
	image_yscale = -1
}
