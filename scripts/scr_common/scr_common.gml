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
	x += _xspd;
	y += _yspd;
}

 