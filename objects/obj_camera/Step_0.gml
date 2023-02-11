if (instance_exists(follow)) {
	if (ENABLE_PANNING == true) {
		with (follow) {
			other.pan = min(other.PAN_MAX, distance_to_object(obj_crosshair) / other.PAN_SCALE)
		}
		var _direction = point_direction(follow.x, follow.y, obj_crosshair.x, obj_crosshair.y)
		to_x = follow.x + lengthdir_x(pan, _direction)
		to_y = follow.y - 20 + lengthdir_y(pan, _direction)
	}
	else {
		to_x = follow.x
		to_y = follow.y
	}
}

x += (to_x - x) / 50
y += (to_y - y) / 50

x = clamp(x, HALF_VIEW_WIDTH, room_width - HALF_VIEW_WIDTH)
y = clamp(y, HALF_VIEW_HEIGHT, room_height - HALF_VIEW_HEIGHT)

camera_set_view_pos(CAMERA, x - HALF_VIEW_WIDTH, y - HALF_VIEW_HEIGHT)
