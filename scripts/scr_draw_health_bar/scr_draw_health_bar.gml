function draw_health_bar() {
	draw_roundrect_colour_ext(
		HEALTH_BAR_BG_X1, 
		HEALTH_BAR_BG_Y1,
		HEALTH_BAR_BG_X2, 
		HEALTH_BAR_BG_Y2,
		UI_ROUNDING, UI_ROUNDING,
		UI_BG_COLOUR, UI_BG_COLOUR,
		false
	)
	draw_sprite_stretched(
		spr_heart, 0,
		HEALTH_BAR_X, 
		HEALTH_BAR_Y,
		HEALTH_BAR_WIDTH * (_health / PLAYER_MAX_HEALTH), 
		HEALTH_BAR_HEIGHT
	)
}