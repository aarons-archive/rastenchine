function draw_hotbar() {
	var hotbar_length = array_length(hotbar)
	draw_sprite_stretched(
		spr_ui_background, 0,
		0, 0,
		5 + 50 + 5 + 3, 
		5 + (hotbar_length * 55) + 3
	)
	for (i = 0; i < hotbar_length; i++) {
		draw_sprite_stretched(
			spr_ui_background, 0,
			5, 
			5 + ((50 + 5) * i),
			50, 50
		)
		var hotbar_item = (hotbar[i] != undefined) ? items[hotbar[i]] : undefined
		if (hotbar_item != undefined) {
			draw_sprite(
				hotbar_item.sprite, 0, 
				5 + (50 / 2),
				5 + ((50 + 5) * i) + 25
			)
		}
	}
}