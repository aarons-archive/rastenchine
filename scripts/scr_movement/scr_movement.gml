function do_run() {
	_stamina = min(_stamina, MAX_STAMINA)
	if _stamina < 1 {
		_stamina_lock = true;
		alarm[0] = 120
	}
	if keyboard_check(vk_shift) && _stamina > 1 && _stamina_lock == false {
		_speed = RUN_SPEED
		_stamina -= 1
	} 
	else {
		_speed = WALK_SPEED
		_stamina += 0.2
	}
}

function do_roll() {
	if (keyboard_check_pressed(vk_space) && _is_rolling == false) {
		_is_rolling = true
		alarm[1] = 30
	}
	if (_is_rolling == true) {
		_iframes = 1
		alarm[3] = 30
		_speed = lerp(_speed, ROLL_SPEED, 0.8)
	}
}

function do_movement(horizontal_input, vertical_input) {

	if (horizontal_input != 0 || vertical_input != 0) {
		if (_is_rolling == false) {
			_direction = point_direction(0, 0, horizontal_input, vertical_input)
		}
		_x_movement = lengthdir_x(_speed, _direction)
		_y_movement = lengthdir_y(_speed, _direction)
	} 
	else {
		_x_movement = 0
		_y_movement = 0
	}
	
	if (place_meeting(x + _x_movement, y, obj_collision)) {
		while (not place_meeting(x + sign(_x_movement), y, obj_collision)) {
			x += sign(_x_movement)
		}
		_x_movement = 0
	}
	if (place_meeting(x, y + _y_movement, obj_collision)) {
		while (not place_meeting(x, y + sign(_y_movement), obj_collision)) {
			y += sign(_y_movement)
		}
		_y_movement = 0
	}
	
	x += _x_movement
	y += _y_movement
}
