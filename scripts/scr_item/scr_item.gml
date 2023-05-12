#macro ITEM_OFFSET (16)

function Item() constructor {

	DEFAULT_SPRITE = undefined
	instance = undefined
	
	offset = ITEM_OFFSET
	_direction = -1
	
	stackable = false
	count = -1
	
	static common = function() {
		instance.x = obj_player._x + lengthdir_x(offset, obj_player._direction)
		instance.y = obj_player._y + lengthdir_y(offset, obj_player._direction)
		
		_direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
		instance.image_angle = _direction
		
		var _depth = (_direction > 0) and (_direction < 180) ? 1 : -1
		instance.depth = obj_player.depth + _depth
		
		var _y_scale = (_direction <= 90) or (_direction >= 270) ? 1 : -1
		instance.image_yscale = lerp(instance.image_yscale, _y_scale, 0.25)
	}
	
	static use = function() {}
}
