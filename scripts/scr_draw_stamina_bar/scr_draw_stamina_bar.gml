#macro STAMINA_BAR_PADDING (3)

#macro STAMINA_BAR_BACKGROUND_WIDTH  (HEALTH_BAR_BACKGROUND_WIDTH * 0.8)
#macro STAMINA_BAR_BACKGROUND_HEIGHT (HEALTH_BAR_BACKGROUND_HEIGHT * 0.9)
#macro STAMINA_BAR_BACKGROUND_X      (GUI_X2 - GUI_MARGIN - STAMINA_BAR_BACKGROUND_WIDTH)
#macro STAMINA_BAR_BACKGROUND_Y      (HEALTH_BAR_BACKGROUND_Y + HEALTH_BAR_BACKGROUND_HEIGHT + GUI_MARGIN)

#macro STAMINA_BAR_FOREGROUND_WIDTH  (STAMINA_BAR_BACKGROUND_WIDTH - (STAMINA_BAR_PADDING * 2))
#macro STAMINA_BAR_FOREGROUND_HEIGHT (STAMINA_BAR_BACKGROUND_HEIGHT - (STAMINA_BAR_PADDING * 2))
#macro STAMINA_BAR_FOREGROUND_X      (STAMINA_BAR_BACKGROUND_X + STAMINA_BAR_PADDING)
#macro STAMINA_BAR_FOREGROUND_Y      (STAMINA_BAR_BACKGROUND_Y + STAMINA_BAR_PADDING)

function draw_stamina_bar() {
	draw_sprite_stretched(
		spr_ui_background, 0,
		STAMINA_BAR_BACKGROUND_X,
		STAMINA_BAR_BACKGROUND_Y,
		STAMINA_BAR_BACKGROUND_WIDTH,
		STAMINA_BAR_BACKGROUND_HEIGHT
	)
	draw_sprite_stretched(
		spr_ui_foreground, 0,
		STAMINA_BAR_FOREGROUND_X, 
		STAMINA_BAR_FOREGROUND_Y,
		STAMINA_BAR_FOREGROUND_WIDTH * (stamina / PLAYER_MAX_STAMINA), 
		STAMINA_BAR_FOREGROUND_HEIGHT
	)
	if (movement_state == player_movement_state.exhausted) {
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_text_color(
			STAMINA_BAR_BACKGROUND_X, 
			STAMINA_BAR_BACKGROUND_Y + STAMINA_BAR_BACKGROUND_HEIGHT,
			"EXAHUSTED!",	
			c_green, c_green, c_green, c_green, 
			1
		)
	}
	if (global.debug_text == true) {
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		draw_text_colour(
			STAMINA_BAR_BACKGROUND_X - GUI_MARGIN, 
			STAMINA_BAR_BACKGROUND_Y + (STAMINA_BAR_BACKGROUND_HEIGHT / 2),
			string(stamina) + "/" + string(PLAYER_MAX_STAMINA), 
			c_white, c_white, c_white, c_white,
			1
		)
	}
}