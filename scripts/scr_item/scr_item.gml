function Item() constructor {
	
	// private
	instance = undefined
	
	// must be overridden in children
	sprite = undefined
	
	// can be overriden in children
	instance_offset = 25    // moves instance out by <x> pixels to rotate around properly.
	instance_y_offset = -15 // moves instance up by <x> pixels to match arm placement.
	
	stackable = false
	count = -1
	
	static common = function() {
		var _direction = point_direction(obj_player.x, obj_player.y, obj_crosshair.x, obj_crosshair.y)
		instance.x = obj_player.x + lengthdir_x(instance_offset, _direction)
		instance.y = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset
		instance.image_angle = _direction
		
		// behind the player when the mouse is in the upper screen area
		if ((_direction > 0) and (_direction < 180)) { instance.depth = obj_player.depth + 1 } 
		// in front of the player when the mouse is in the lower screen area
		else { instance.depth = obj_player.depth - 1 }
		
		// facing right when the mouse is in the right screen area
		if ((_direction <= 90) or (_direction >= 270)) { instance.image_yscale = lerp(instance.image_yscale, 1, 0.25) }
		// facing left when the mouse is in the left screen area
		else { instance.image_yscale = lerp(instance.image_yscale, -1, 0.25) }
	}
	
	static use = function() {}
}
