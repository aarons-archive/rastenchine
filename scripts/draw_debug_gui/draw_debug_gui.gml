function draw_debug_gui() {
	// vertical line
	draw_line_colour(
		GUI_X1, GUI_MIDDLE_Y - 1, 
		GUI_X2, GUI_MIDDLE_Y - 1, 
		c_white, c_white
	)
	draw_line_colour(
		GUI_X1, GUI_MIDDLE_Y, 
		GUI_X2, GUI_MIDDLE_Y, 
		c_white, c_white
	)
	// horizontal line
	draw_line_colour(
		GUI_MIDDLE_X - 1, GUI_Y1, 
		GUI_MIDDLE_X - 1, GUI_Y2, 
		c_white, c_white
	)
	draw_line_colour(
		GUI_MIDDLE_X, GUI_Y1, 
		GUI_MIDDLE_X, GUI_Y2, 
		c_white, c_white
	)	
}