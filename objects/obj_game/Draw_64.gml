if (global.debug_text == true) { 
	// draw debug text
	draw_debug_text() 
}

if (global.debug_alignment == true) { 
	// vertial alignment line
	draw_line_colour(
		UI_X1, UI_Y_MIDDLE, 
		UI_X2, UI_Y_MIDDLE, 
		c_white, c_white
	)
	// horizontal alignment line
	draw_line_colour(
		UI_X_MIDDLE, UI_Y1, 
		UI_X_MIDDLE, UI_Y2, 
		c_white, c_white
	)	
}

if (global.paused == true) and (pause_sprite != undefined) {
	// draw pause sprite
	draw_sprite(pause_sprite, 0, 0, 0)
	// draw darkened background
	draw_set_alpha(0.75)
	draw_rectangle_colour(UI_X1, UI_Y1, UI_X2, UI_Y2, c_black, c_black, c_black, c_black, false)
	// draw paused text
	draw_set_font(fnt_menu)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(UI_X_MIDDLE, UI_Y_MIDDLE, "PAUSED")
}