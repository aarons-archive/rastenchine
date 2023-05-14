function angle_in_top_right(angle)    { return (angle >= 0) and (angle <= 90) }
function angle_in_top_left(angle)     { return (angle >= 90) and (angle <= 180) }
function angle_in_bottom_left(angle)  { return (angle >= 180) and (angle <= 270) }
function angle_in_bottom_right(angle) { return (angle >= 270) and (angle <= 360) }

function angle_on_top_side(angle)    { return angle_in_top_right(angle) or angle_in_top_left(angle) }
function angle_on_bottom_side(angle) { return angle_in_bottom_right(angle) or angle_in_bottom_left(angle) }
function angle_on_right_side(angle)  { return angle_in_top_right(angle) or angle_in_bottom_right(angle) }
function angle_on_left_side(angle)   { return angle_in_top_left(angle) or angle_in_bottom_left(angle) }

function Item() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE      = undefined
	HAND_SPRITE = undefined
	
	///////////////////////
	// distances/offsets //
	///////////////////////
	DEFAULT_DISTANCE = 6
	X_DISTANCE       = -1
	Y_DISTANCE       = 0
	X_OFFSET         = 0
	Y_OFFSET         = 3
	distance = DEFAULT_DISTANCE
	
	//////////
	// misc //
	/////////
	instance = undefined
	angle    = 0

	///////////////
	// stackable //
	///////////////
	stackable = false
	count     = -1
	
	static common = function() {
		angle = point_direction(obj_player._x, obj_player._y, mouse_x, mouse_y)
		// move the item away from the player by a certain distance 
		// in the direction of the cursor
		instance.x = obj_player._x + lengthdir_x(distance + X_DISTANCE, angle) + X_OFFSET
		instance.y = obj_player._y + lengthdir_y(distance + Y_DISTANCE, angle) + Y_OFFSET
		// change the items sprite angle depending on the direction
		// of the cursor
		instance.image_angle = angle
		// flip the items sprite depending on if the item is on the 
		// left or right side of the screen
		var _y_scale = (angle_on_right_side(angle)) ? (1) : (-1)
		instance.image_yscale = lerp(instance.image_yscale, _y_scale, 0.25)
		// change the items depth depending on if the item is on the 
		// top or bottom side of the screen
		var _depth = (angle_on_top_side(angle)) ? (1) : (-1)
		instance.depth = obj_player.depth + _depth
	}
	
	static use = function() {}
}
