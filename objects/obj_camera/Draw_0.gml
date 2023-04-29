if (global.debug_camera == true) {
	// draw line from follow object to cursor
	draw_line_colour(
		follow.x, follow.y - PLAYER_ORIGIN_OFFSET,
		mouse_x, mouse_y,
		c_white, c_white
	)
}
