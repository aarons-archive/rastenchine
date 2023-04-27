if (global.debug_text == true) { draw_debug_text() }

if (global.paused == true) and (pause_sprite != undefined) {
	// 
	draw_sprite(pause_sprite, 0, 0, 0)
	//
	draw_set_alpha(0.75)
	draw_rectangle_colour(UI_X1, UI_Y1, UI_X2, UI_Y2, c_black, c_black, c_black, c_black, false)
	//
	draw_set_font(fnt_menu)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(UI_X_MIDDLE, UI_Y_MIDDLE, "PAUSED")
}