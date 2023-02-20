enum weapon_state {
	idle,
	charging,
	attacking,
	cooldown,
	shooting,
}

function Weapon() : Item() constructor {
	
	// set by inventory
	instance = undefined
	
	// set by subclasses
	sprite = undefined
	damage = undefined
	
	// common
	state = weapon_state.idle
	
	center_y_offset = -8
	center_y = obj_player.y + center_y_offset
	distance = 50
	_direction = 0
	
	static draw = function() {
		center_y = obj_player.y + center_y_offset
		_direction = point_direction(obj_player.x, center_y, mouse_x, mouse_y)
		instance.image_angle = _direction
		instance.depth = obj_player.depth + (_direction > 90 && _direction < 270)
		instance.x = obj_player.x + lengthdir_x(distance, _direction)
		instance.y = obj_player.y + lengthdir_y(distance, _direction)
		distance = lerp(distance, 30, 0.1)
		instance.image_yscale = (_direction > 90 and _direction < 270) ? -1 : 1
	}
}