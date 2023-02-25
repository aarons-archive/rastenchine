#macro STAMINA_BAR_SCALE  0.85
#macro STAMINA_BAR_WIDTH  HEALTH_BAR_WIDTH * STAMINA_BAR_SCALE
#macro STAMINA_BAR_HEIGHT HEALTH_BAR_HEIGHT * STAMINA_BAR_SCALE

#macro STAMINA_BAR_BG_X1  UI_X2 - STAMINA_BAR_WIDTH - (UI_PADDING * 2)
#macro STAMINA_BAR_BG_Y1  HEALTH_BAR_BG_Y2 + UI_MARGIN
#macro STAMINA_BAR_BG_X2  UI_X2
#macro STAMINA_BAR_BG_Y2  STAMINA_BAR_BG_Y1 + STAMINA_BAR_HEIGHT + (UI_PADDING * 2)
#macro STAMINA_BAR_MIDDLE STAMINA_BAR_BG_Y1 + (STAMINA_BAR_HEIGHT / 2) + UI_PADDING

#macro STAMINA_BAR_FG_X1 STAMINA_BAR_BG_X1 + UI_PADDING
#macro STAMINA_BAR_FG_Y1 STAMINA_BAR_BG_Y1 + UI_PADDING
#macro STAMINA_BAR_FG_X2 STAMINA_BAR_BG_X2 - UI_PADDING
#macro STAMINA_BAR_FG_Y2 STAMINA_BAR_BG_Y2 - UI_PADDING

function draw_stamina_bar() {
	draw_roundrect_colour_ext(
		STAMINA_BAR_BG_X1,
		STAMINA_BAR_BG_Y1,
		STAMINA_BAR_BG_X2, 
		STAMINA_BAR_BG_Y2,
		UI_ROUNDING, UI_ROUNDING,
		UI_BG_COLOUR, UI_BG_COLOUR,
		false
	)
	draw_roundrect_colour_ext(
		STAMINA_BAR_FG_X1, 
		STAMINA_BAR_FG_Y1,
		STAMINA_BAR_FG_X1 + (STAMINA_BAR_WIDTH * (stamina / PLAYER_MAX_STAMINA)), 
		STAMINA_BAR_FG_Y2,
		UI_ROUNDING, UI_ROUNDING,
		UI_BG_ACTIVE_COLOUR, UI_BG_ACTIVE_COLOUR,
		false
	)
	if (stamina_lock == true) {
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_text_color(
			STAMINA_BAR_BG_X1, 
			STAMINA_BAR_BG_Y2 + UI_MARGIN, 
			"EXAHUSTED!",	
			c_green, c_green, c_green, c_green, 
			1
		)
	}
	if (DEBUG == true) {
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text_colour(
			STAMINA_BAR_BG_X1 - UI_MARGIN, 
			STAMINA_BAR_MIDDLE, 
			string(stamina) + "/" + string(PLAYER_MAX_STAMINA), 
			c_white, c_white, c_white, c_white,
			1
		)
	}
}