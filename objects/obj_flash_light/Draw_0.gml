draw_set_alpha(0.75)
draw_set_color(c_yellow)

var _direction = point_direction(x, y, mouse_x, mouse_y)
draw_triangle(
	x, y, 
	x + lengthdir_x(1200, _direction + 18), y + lengthdir_y(1200, _direction + 18), 
	x + lengthdir_x(1200, _direction - 18), y + lengthdir_y(1200, _direction - 18),
	false
)