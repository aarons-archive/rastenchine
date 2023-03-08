function run() {
	if (stamina < 1) {
		stamina_lock = true;
		alarm[0] = 120
	}
	if (keyboard_check(vk_shift) && stamina > 1 && stamina_lock == false) {
		speed_ = PLAYER_RUN_SPEED
		stamina -= 1
	} 
	else {
		speed_ = PLAYER_WALK_SPEED
		stamina += 0.2
	}
	stamina = min(stamina, PLAYER_MAX_STAMINA)
}

function roll() {
	if (keyboard_check_pressed(vk_space)) {
		state = player_states.rolling
		alarm[1] = 30
	}
	if (state == player_states.rolling) {
		iframes = 1
		alarm[3] = 30
		speed_ = lerp(speed_, PLAYER_ROLL_SPEED, 0.8)
	}
}

function movement() {

	if (x_input != 0 || y_input != 0) {
		xy_direction = point_direction(0, 0, x_input, y_input)
		x_movement = lengthdir_x(speed_, xy_direction)
		y_movement = lengthdir_y(speed_, xy_direction)
	} 
	else {
		x_movement = 0
		y_movement = 0
	}
	
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
