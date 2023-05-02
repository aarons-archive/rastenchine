if (pan_enabled) {
	// calculate the panning pixels/direction
	var _pan = min(PAN_MAX, distance_to_point(mouse_x, mouse_y) / PAN_SCALE)
	var _direction = point_direction(follow.x, follow.y - PLAYER_ORIGIN_OFFSET, mouse_x, mouse_y)
	// move the camera object to the same place as the follow object, accounting for panning and smoothing
	x += ((follow.x + lengthdir_x(_pan, _direction)) - x) / SMOOTHING
	y += ((follow.y + lengthdir_y(_pan, _direction) - PLAYER_ORIGIN_OFFSET) - y) / SMOOTHING
}
else {
	// move the camera object to the same place as the follow object, accounting for panning and smoothing
	x += ((follow.x) - x) / SMOOTHING
	y += ((follow.y - PLAYER_ORIGIN_OFFSET) - y) / SMOOTHING
}

var half_view_width
var half_view_height

if (global.camera_zooming == true) {
	// get the current view width/height
	var current_view_width = camera_get_view_width(camera)
	var current_view_height = camera_get_view_height(camera)
	// calculate the zoom level
	zoom = clamp(zoom + (((mouse_wheel_down() - mouse_wheel_up())) * 0.05), ZOOM_MIN, ZOOM_MAX)
	// calculate the zoom width/height
	var zoom_width = lerp(current_view_width, zoom * default_view_width, 0.05)
	var zoom_height = lerp(current_view_height, zoom * default_view_height, 0.05)
	// set the cameras view size
	camera_set_view_size(camera, zoom_width, zoom_height)
	// calculate half the view width/height
	half_view_width = current_view_width / 2
	half_view_height = current_view_height / 2
}
else {
	// set the cameras view size
	camera_set_view_size(camera, default_view_width, default_view_height)
	// calculate half the view width/height
	half_view_width = default_view_width / 2
	half_view_height = default_view_height / 2
	// make sure the camera can't move outside of the rooms bounds
	if (global.debug_camera == false) { 
		x = clamp(x, half_view_width, room_width - half_view_width)
		y = clamp(y, half_view_height, room_height - half_view_height)
	}
	
}

// set the cameras view position
camera_set_view_pos(camera, x - half_view_width, y - half_view_height)
