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
		STAMINA_BAR_FG_X1 + (STAMINA_BAR_WIDTH * (_stamina / MAX_STAMINA)), 
		STAMINA_BAR_FG_Y2,
		UI_ROUNDING, UI_ROUNDING,
		UI_BG_ACTIVE_COLOUR, UI_BG_ACTIVE_COLOUR,
		false
	)
}