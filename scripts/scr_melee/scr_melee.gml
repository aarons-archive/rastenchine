function Melee() : Weapon() constructor {
	
	instance_offset = 16
	
	instance_x_offset = 0
	instance_y_offset = -20

	static common = function() {
		var _direction = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y)
		if (_direction > 0) and (_direction < 180) {
			instance_y_offset = lerp(instance_y_offset, -28, 0.1)
		}
		else {
			instance_y_offset = lerp(instance_y_offset, -20, 0.1)
		}
		instance.x = obj_player.x - lengthdir_x(instance_offset, _direction) + instance_x_offset
		instance.y = obj_player.y - lengthdir_y(instance_offset, _direction) + instance_y_offset
		instance.image_angle = _direction
		
		// behind the player when the mouse is in the upper screen area
		if ((_direction > 0) and (_direction < 180)) { instance.depth = obj_player.depth - 1 } 
		// in front of the player when the mouse is in the lower screen area
		else { instance.depth = obj_player.depth + 1 }
		// facing right when the mouse is in the right screen area
		if ((_direction <= 90) or (_direction >= 270)) { instance.image_yscale = lerp(instance.image_yscale, 1, 0.25) }
		// facing left when the mouse is in the left screen area
		else { instance.image_yscale = lerp(instance.image_yscale, -1, 0.25) }
		
		if (state == weapon_state.charging) {
			// instance_x_offset = 3
			instance.image_angle = instance.image_angle + 0
		}
		else {
			// instance_x_offset = 0
			instance.image_angle = instance.image_angle - 0
		}
	}
}