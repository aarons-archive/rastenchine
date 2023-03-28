#macro HOTBAR_PADDING (8)

#macro HOTBAR_SLOT_WIDTH  (60)
#macro HOTBAR_SLOT_HEIGHT (60) 

#macro HOTBAR_BACKGROUND_WIDTH	((HOTBAR_PADDING * 2) + HOTBAR_SLOT_WIDTH)
#macro HOTBAR_BACKGROUND_HEIGHT (undefined) // calculated on demand
#macro HOTBAR_BACKGROUND_X      (UI_X1 + UI_MARGIN)
#macro HOTBAR_BACKGROUND_Y      (UI_Y1 + UI_MARGIN)

#macro HOTBAR_SLOT_X (HOTBAR_BACKGROUND_X + HOTBAR_PADDING)
#macro HOTBAR_SLOT_Y (undefined) // calculated on demand

function draw_hotbar() {
	var hotbar_length = array_length(hotbar)
	draw_sprite_stretched(
		spr_ui_background, 0,
		HOTBAR_BACKGROUND_X, 
		HOTBAR_BACKGROUND_Y,
		HOTBAR_BACKGROUND_WIDTH, 
		HOTBAR_PADDING + ((HOTBAR_SLOT_WIDTH + UI_MARGIN) * hotbar_length) + (HOTBAR_PADDING - UI_MARGIN)
	)
	
	for (var i = 0; i < hotbar_length; i++) {
		var slot_y = HOTBAR_BACKGROUND_Y + HOTBAR_PADDING + ((HOTBAR_SLOT_WIDTH + UI_MARGIN) * i)
		var colour = (i == index) ? c_green : c_white
		draw_sprite_stretched_ext(
			spr_ui_background, 0,
			HOTBAR_SLOT_X, 
			slot_y,
			HOTBAR_SLOT_WIDTH, 
			HOTBAR_SLOT_HEIGHT,
			colour, 1
		)
		try {
			hotbar_item = (hotbar[i] != undefined) ? inventory[hotbar[i]] : undefined
		}
		catch (exception) {
			hotbar_item = undefined
		}
		if (hotbar_item != undefined) {
			draw_sprite(
				hotbar_item.sprite, 0, 
				HOTBAR_SLOT_X + (HOTBAR_SLOT_WIDTH / 2),
				slot_y + (HOTBAR_SLOT_HEIGHT / 2)
			)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_text(
				HOTBAR_SLOT_X + (HOTBAR_SLOT_WIDTH / 2) + 18,
				slot_y + (HOTBAR_SLOT_HEIGHT / 2) + 9,
				string(hotbar_item.count),
			)
		}
	}
}