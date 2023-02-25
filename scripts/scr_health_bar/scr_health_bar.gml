#macro HEALTH_BAR_SPRITE spr_health_bar_heart
#macro HEALTH_BAR_SCALE  10
#macro HEALTH_BAR_WIDTH  sprite_get_width(HEALTH_BAR_SPRITE) * HEALTH_BAR_SCALE
#macro HEALTH_BAR_HEIGHT sprite_get_height(HEALTH_BAR_SPRITE)

#macro HEALTH_BAR_BG_X1  UI_X2 - HEALTH_BAR_WIDTH - (UI_PADDING * 2) + UI_TUNING
#macro HEALTH_BAR_BG_Y1  UI_Y1 - UI_TUNING
#macro HEALTH_BAR_BG_X2  UI_X2 
#macro HEALTH_BAR_BG_Y2  HEALTH_BAR_BG_Y1 + HEALTH_BAR_HEIGHT + (UI_PADDING * 2) - UI_TUNING
#macro HEALTH_BAR_MIDDLE HEALTH_BAR_BG_Y1 + (HEALTH_BAR_HEIGHT / 2) + UI_PADDING - UI_TUNING

#macro HEALTH_BAR_X HEALTH_BAR_BG_X1 + UI_PADDING
#macro HEALTH_BAR_Y HEALTH_BAR_BG_Y1 + UI_PADDING

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
		spr_health_bar_heart, 0,
		HEALTH_BAR_X, 
		HEALTH_BAR_Y,
		HEALTH_BAR_WIDTH * (_health / PLAYER_MAX_HEALTH), 
		HEALTH_BAR_HEIGHT
	)
	if (DEBUG == true) {
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text_colour(
			HEALTH_BAR_BG_X1 - UI_MARGIN, 
			HEALTH_BAR_MIDDLE,
			string(_health) + "/" + string(PLAYER_MAX_HEALTH), 
			c_white, c_white, c_white, c_white,
			1
		)
	}
}