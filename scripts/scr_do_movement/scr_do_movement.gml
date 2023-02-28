function do_movement() {

	if ((x_input == 0) and (y_input == 0)) { 
		return 
	}
	
	_direction = point_direction(0, 0, x_input, y_input)
	var x_movement = lengthdir_x(_speed, _direction)
	var y_movement = lengthdir_y(_speed, _direction)

	if (place_meeting(x + x_movement, y, obj_player_collision)) {
		while (not place_meeting(x + sign(x_movement), y, obj_player_collision)) {
			x += sign(x_movement)
		}
		x_movement = 0
	}
	if (place_meeting(x, y + y_movement, obj_player_collision)) {
		while (not place_meeting(x, y + sign(y_movement), obj_player_collision)) {
			y += sign(y_movement)
		}
		y_movement = 0
	}

	x += x_movement
	y += y_movement
}