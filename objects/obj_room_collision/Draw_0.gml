if (global.debug_lights == true) {
	draw_self()
	if (light != undefined) { 
		draw_set_font(fnt_game)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(middle_x, middle_y, string(self.id))	
		draw_text(middle_x, middle_y + 15, string(self))	
	}
}