#macro HEALTH_BAR_PADDING (6)

#macro HEALTH_BAR_SPRITE        (spr_health_bar_heart)
#macro HEALTH_BAR_SPRITE_SCALE  (10)
#macro HEALTH_BAR_SPRITE_WIDTH  (sprite_get_width(HEALTH_BAR_SPRITE) * HEALTH_BAR_SPRITE_SCALE)
#macro HEALTH_BAR_SPRITE_HEIGHT (sprite_get_height(HEALTH_BAR_SPRITE))

#macro HEALTH_BAR_BACKGROUND_WIDTH  ((HEALTH_BAR_PADDING * 2) + HEALTH_BAR_SPRITE_WIDTH)
#macro HEALTH_BAR_BACKGROUND_HEIGHT ((HEALTH_BAR_PADDING * 2) + HEALTH_BAR_SPRITE_HEIGHT)
#macro HEALTH_BAR_BACKGROUND_X      (GUI_X2 - HEALTH_BAR_BACKGROUND_WIDTH)
#macro HEALTH_BAR_BACKGROUND_Y      (GUI_Y1)

#macro HEALTH_BAR_SPRITE_X (HEALTH_BAR_BACKGROUND_X + HEALTH_BAR_PADDING)
#macro HEALTH_BAR_SPRITE_Y (HEALTH_BAR_BACKGROUND_Y + HEALTH_BAR_PADDING)

function draw_health_bar() {
	draw_sprite_stretched(
		spr_gui_background, 0,
		HEALTH_BAR_BACKGROUND_X,
		HEALTH_BAR_BACKGROUND_Y,
		HEALTH_BAR_BACKGROUND_WIDTH,
		HEALTH_BAR_BACKGROUND_HEIGHT
	)
	draw_sprite_stretched(
		HEALTH_BAR_SPRITE, 0,
		HEALTH_BAR_SPRITE_X, 
		HEALTH_BAR_SPRITE_Y,
		HEALTH_BAR_SPRITE_WIDTH * (_health / PLAYER_MAX_HEALTH), 
		HEALTH_BAR_SPRITE_HEIGHT
	)
	if (global.debug_text == true) {
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text_colour(
			HEALTH_BAR_BACKGROUND_X - GUI_MARGIN, 
			HEALTH_BAR_BACKGROUND_Y + (HEALTH_BAR_BACKGROUND_HEIGHT / 2),
			string(_health) + "/" + string(PLAYER_MAX_HEALTH), 
			c_white, c_white, c_white, c_white,
			1
		)
	}
}