x = obj_player.x
y = obj_player.y

var _direction = point_direction(x, y, mouse_x, mouse_y)

if (
	point_in_triangle(
		x, y,
		x, y, 
		obj_player.x + lengthdir_x(1200, _direction + 18), obj_player.y + lengthdir_y(1200, _direction + 18), 
		obj_player.x + lengthdir_x(1200, _direction - 18), obj_player.y + lengthdir_y(1200, _direction - 18),
	)
	||
	point_in_circle(
		x, y,
		obj_player.x, obj_player.y, 
		110
	)
) {
	visible = true
}
else {
	visible = false
}