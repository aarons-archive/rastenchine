inventory.step()

x_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
y_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)

var _pressing_wasd = ((x_input != 0) or (y_input != 0))
var _pressing_run = keyboard_check(global.RUN_KEY)
var _pressing_dodge = keyboard_check_pressed(global.DODGE_KEY)

switch (state) {
	case player_state.idle:
		if (_pressing_wasd == true) { state = player_state.walking }
		_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
		stamina = min(PLAYER_MAX_STAMINA, stamina + 0.5)
		break
		
	case player_state.walking:
		if (_pressing_wasd == false) { state = player_state.idle }
		else if (_pressing_run == true) { state = player_state.running }
		else if (_pressing_dodge == true) { state = player_state.dodging }
		_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
		stamina = min(PLAYER_MAX_STAMINA, stamina + 0.5)
		break
		
	case player_state.running:
		if (_pressing_wasd == false) { state = player_state.idle }
		else if (_pressing_run == false) { state = player_state.walking }
		else if (_pressing_dodge == true) { state = player_state.dodging }
		_speed = lerp(_speed, PLAYER_RUN_SPEED, 0.2)
		stamina = max(PLAYER_MIN_STAMINA, stamina - 1)
		break
		
	case player_state.dodging:
		if (alarm[1] == -1) { alarm[1] = PLAYER_DODGE_FRAMES }
		_speed = lerp(_speed, PLAYER_DODGE_SPEED, 0.2)
		stamina = max(PLAYER_MIN_STAMINA, stamina - 2)
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