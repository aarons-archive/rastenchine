function Item() constructor {
	
	// should not be set by anything
	instance = undefined
	
	// must be overridden in subclasses
	sprite = undefined
	
	// can be overriden in subclasses to customise instance placement
	instance_offset = 15   // distance from the players center 
	instance_y_offset = -5 // item up by x pixels (to match hand position)
	
	static alarm_one = function() {}
	static alarm_two = function() {}
	static alarm_three = function() {}
	static alarm_four = function() {}
	static alarm_five = function() {}

	static common = function() {
		var _direction = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y)
		instance.x = obj_player.x + lengthdir_x(instance_offset, _direction)
		instance.y = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset
		instance.image_angle = _direction
		
		// behind the player when the mouse is in the upper screen area
		if ((_direction > 0) and (_direction < 180)) { instance.depth = obj_player.depth + 1 } 
		// infront of the player when the mouse is in the lower screen area
		else { instance.depth = obj_player.depth - 1 }
		
		// facing right when the mouse is in the right screen area
		if ((_direction <= 90) or (_direction >= 270)) { instance.image_yscale = lerp(instance.image_yscale, 1, 0.3) }
		// facing left when the mouse is in the left screen area
		else { instance.image_yscale = lerp(instance.image_yscale, -1, 0.3) }
	}
	
	static use = function() {}
}
