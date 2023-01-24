function Entity(health_, speed_) constructor {
	MIN_HEALTH = 0
	MAX_HEALTH = health_
	_health = MAX_HEALTH
	
	MAX_SPEED = speed_
	_speed = MAX_SPEED
	
	static heal = function(amount) { _health = min(_health + amount, MAX_HEALTH) }
	static damage = function(amount) { _health = max(_health - amount, MIN_HEALTH) }
	static reset_health = function() { _health = MAX_HEALTH }
	
	static do_movement = function() {}
}

function Player(health_, speed_, stamina) : Entity(health_, speed_) constructor {
	MAX_STAMINA = stamina
	_stamina = MAX_STAMINA
	
	_move_spd = 3;
	
	static do_movement = function() {
		_key_right = keyboard_check(ord("D"));
		_key_left = keyboard_check(ord("A"));
		_key_up = keyboard_check(ord("W"));
		_key_down = keyboard_check(ord("S"));
		
		#region Player movement
		//Movement
		var _horizKey = _key_right - _key_left;
		var _vertKey = _key_down - _key_up;
		_move_dir = point_direction(0,0, _horizKey, _vertKey);
		
		//Get x and y speed
		var _spd = 0;
		var _inputLevel = point_distance(0,0,_horizKey,_vertKey);
		_inputLevel = clamp(_inputLevel,0,1);
		_spd = +_move_spd * _inputLevel;
		
		_xspd = lengthdir_x(_spd, _move_dir);
		_yspd = lengthdir_y(_spd, _move_dir);
		
		//Collision
		if place_meeting(other.x+_xspd,other.y,obj_collision)
		{
			_xspd = 0;	
		}
		if place_meeting(other.x,y+_yspd,obj_collision)
		{
			_yspd = 0;	
		}
		//Move player
		other.x += _xspd;
		other.y += _yspd;
		
		//depth = -bbox_bottom;
		#endregion
	}
}
