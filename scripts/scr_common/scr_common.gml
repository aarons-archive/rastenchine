function heal(amount) { _health = min(_health + amount, MAX_HEALTH) }
function damage(amount) { _health = max(_health - amount, MIN_HEALTH) }
function reset_health() { _health = MAX_HEALTH }

function do_movement(horizontal_input, vertical_input) {

	_move_dir = point_direction(0,0, horizontal_input, vertical_input);
		
	//Get x and y speed
	var _spd = 0;
	var _inputLevel = point_distance(0 ,0, horizontal_input, vertical_input);
	_inputLevel = clamp(_inputLevel, 0, 1);


	_spd = +_move_spd * _inputLevel;
	
	_xspd = lengthdir_x(_spd, _move_dir);
	_yspd = lengthdir_y(_spd, _move_dir);
		
	#region Collision
	if place_meeting(other.x + _xspd, other.y, obj_collision) {
		_xspd = 0;	
	}
	if place_meeting(other.x, y + _yspd, obj_collision) {
		_yspd = 0;	
	}
	#endregion
	//Move player
	if keyboard_check_pressed(vk_space)
	{
		x += _xspd * _roll_spd;
		y += _yspd * _roll_spd;
	} else
	{
	x += _xspd;
	y += _yspd;
	}	
	#region Stamina
if _stamina >= 100
{
	_stamina = MAX_STAMINA
}
if _stamina < 1 
{
	_stamina_lock = 1;
	alarm[0] = 120;
}
if keyboard_check(vk_shift) && _stamina > 1 && _stamina_lock = 0
{
	_move_spd = 6;
	_stamina -= 1;
} else {
	_move_spd = 3;
	_stamina += 0.2;
}
#endregion
}

function weapon_attacks()
{
		_center_y = other.y + _center_y_offset;
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y);
	
	if mouse_check_button_pressed(mb_left)
	{
	}
}

function draw_my_weapon()
{
	//weapon depth
	var _depth = (_aim_dir > 90 && _aim_dir < 270);
	_weap.depth = depth + _depth;
	_weap.image_angle = _aim_dir;
	
	_weap.x = x + lengthdir_x(_weap_dis, _aim_dir);
	_weap.y = y + lengthdir_y(_weap_dis, _aim_dir);

	_weap_dis = lerp(_weap_dis, 30, 0.1);

	//flip weapon upright
	if _aim_dir > 90 && _aim_dir < 270
	{
		_weap.image_yscale = -1;	
	} else { _weap.image_yscale = 1; }
}
 