function heal(amount) { _health = min(_health + amount, MAX_HEALTH) }
function damage(amount) { _health = max(_health - amount, MIN_HEALTH) }
function reset_health() { _health = MAX_HEALTH }

function do_movement(horizontal_input, vertical_input) {

	#region Movement Calculation
	if (horizontal_input != 0 || vertical_input != 0) {
		var _direction = point_direction(0, 0, horizontal_input, vertical_input)
		_x_movement = lengthdir_x(_speed, _direction)
		_y_movement = lengthdir_y(_speed, _direction)
	} 
	else {
		_x_movement = 0
		_y_movement = 0
	}
	#endregion
	
	#region Collision Detection	
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
	#endregion
	
	#region Misc
	if keyboard_check_pressed(vk_space) {
		x += _x_movement * _roll_spd
		y += _y_movement * _roll_spd
	} 
	else {
		x += _x_movement
		y += _y_movement
	}	
	if _stamina >= 100 {
		_stamina = MAX_STAMINA
	}
	if _stamina < 1 {
		_stamina_lock = 1;
		alarm[0] = 120;
	}
	if keyboard_check(vk_shift) && _stamina > 1 && _stamina_lock = 0 {
		_move_spd = 6;
		_stamina -= 1;
	} 
	else {
		_move_spd = 3;
		_stamina += 0.2;
	}
	#endregion
}

function weapon_attacks() {
	_center_y = other.y + _center_y_offset
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
	
	if mouse_check_button_pressed(mb_left) {}
}

function draw_my_weapon() {

	var _depth = (_aim_dir > 90 && _aim_dir < 270);
	_weap.depth = depth + _depth;
	_weap.image_angle = _aim_dir;
	
	_weap.x = x + lengthdir_x(_weap_dis, _aim_dir);
	_weap.y = y + lengthdir_y(_weap_dis, _aim_dir);

	_weap_dis = lerp(_weap_dis, 30, 0.1);

	if _aim_dir > 90 && _aim_dir < 270 {
		_weap.image_yscale = -1
	} 
	else { 
		_weap.image_yscale = 1
	}
}
 