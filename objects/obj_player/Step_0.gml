inventory.step()

x_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
y_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
wasd_input = ((x_input != 0) or (y_input != 0))
run_input = keyboard_check(global.RUN_KEY)
dodge_input = keyboard_check_pressed(global.DODGE_KEY)

if ((stamina <= 0) and (movement_state != player_movement_state.dodging)) {
	movement_state = player_movement_state.exhausted
}

var can_run = (run_input == true) and (stamina >= 1)
var can_dodge = (dodge_input == true) and (stamina >= 20)

switch (movement_state) {
	case player_movement_state.not_moving:
		if (wasd_input == true) {
			movement_state = player_movement_state.walking
		}
		_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
		stamina = min(PLAYER_MAX_STAMINA, stamina + 0.5)
		break
		
	case player_movement_state.walking:
		if (wasd_input == false) { 
			movement_state = player_movement_state.not_moving
		}
		else if (can_run == true) { 
			movement_state = player_movement_state.running
		}
		else if (can_dodge == true) { 
			movement_state = player_movement_state.dodging 
		}
		_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
		stamina = min(PLAYER_MAX_STAMINA, stamina + 0.5)
		break
		
	case player_movement_state.running:
		if (wasd_input == false) { 
			movement_state = player_movement_state.not_moving
		}
		else if (can_run == false) { 
			movement_state = player_movement_state.walking
		}
		else if (can_dodge == true) { 
			movement_state = player_movement_state.dodging 
		}
		_speed = lerp(_speed, PLAYER_RUN_SPEED, 0.2)
	    stamina = max(PLAYER_MIN_STAMINA, stamina - 1)
		break
		
	case player_movement_state.dodging:
		//if (alarm[1] == -1) { alarm[1] = PLAYER_DODGE_FRAMES }
		//_speed = lerp(_speed, PLAYER_DODGE_SPEED, 0.2)
		//stamina = max(PLAYER_MIN_STAMINA, stamina - 2)
		break
		
	case player_movement_state.exhausted:
		_speed = lerp(_speed, PLAYER_EXHAUSTED_SPEED, 0.2)
		stamina = min(PLAYER_MAX_STAMINA, stamina + 0.2)
		if (stamina >= (PLAYER_MAX_STAMINA * 0.3)) {
			movement_state = player_movement_state.not_moving
		}
		break
}

if (x_input != 0) or (y_input != 0) {
	_direction = point_direction(0, 0, x_input, y_input)
	x_movement = lengthdir_x(_speed, _direction)
	y_movement = lengthdir_y(_speed, _direction)
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