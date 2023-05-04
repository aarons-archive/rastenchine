#macro ITEM_OFFSET (16)
#macro ITEM_Y_OFFSET (2)

function Item() constructor {

	instance = undefined
	DEFAULT_SPRITE = undefined
	
	offset = ITEM_OFFSET
	
	stackable = false
	count = -1
	
	static common = function() {
		instance.x = obj_player._x + lengthdir_x(offset, obj_player._direction)
		instance.y = obj_player._y + lengthdir_y(offset, obj_player._direction)
		instance.image_angle = obj_player._direction
		
		// behind the player when the mouse is in the upper area of the screen
		if ((obj_player._direction > 0) and (obj_player._direction < 180)) { 
			instance.depth = obj_player.depth + 1
		} 
		// in front of the player when the mouse is in the lower area of the screen
		else { 
			instance.depth = obj_player.depth - 1 
		}
		
		// facing right when the mouse is on the right side of the screen
		if ((obj_player._direction <= 90) or (obj_player._direction >= 270)) { 
			instance.image_yscale = lerp(instance.image_yscale, 1, 0.25) 
		}
		// facing left when the mouse is on the left side of the screen
		else { 
			instance.image_yscale = lerp(instance.image_yscale, -1, 0.25) 
		}
	}
	
	static use = function() {}
}
