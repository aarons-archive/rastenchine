if (global.debug_text == true) { 
	// draw debug text
	draw_debug_text() 
}

if (global.debug_alignment == true) {
	// vertial alignment line
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
	// horizontal alignment line
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

if (global.paused == true) and (pause_sprite != undefined) {
	// draw pause sprite
	draw_sprite(pause_sprite, 0, 0, 0)
	// draw darkened background
	draw_set_alpha(0.75)
	draw_rectangle_colour(GUI_X1, GUI_Y1, GUI_X2, GUI_Y2, c_black, c_black, c_black, c_black, false)
	// draw paused text
	draw_set_font(fnt_menu)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(GUI_MIDDLE_X, GUI_MIDDLE_Y, "PAUSED")
}