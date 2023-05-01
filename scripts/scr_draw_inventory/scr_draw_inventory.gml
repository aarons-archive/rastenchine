#macro INVENTORY_PADDING (4)
#macro INVENTORY_MARGIN  (4)

#macro INVENTORY_SLOT_WIDTH   (48 + (INVENTORY_PADDING * 2))
#macro INVENTORY_SLOT_HEIGHT  (48 + (INVENTORY_PADDING * 2))
#macro INVENTORY_SLOT_COUNT_X (9)
#macro INVENTORY_SLOT_COUNT_Y (5)

#macro INVENTORY_BACKGROUND_WIDTH  ((GUI_BG_OFFSET * 2) + INVENTORY_MARGIN + ((INVENTORY_SLOT_WIDTH + INVENTORY_MARGIN) * INVENTORY_SLOT_COUNT_X))
#macro INVENTORY_BACKGROUND_HEIGHT ((GUI_BG_OFFSET * 2) + INVENTORY_MARGIN + ((INVENTORY_SLOT_HEIGHT + INVENTORY_MARGIN) * INVENTORY_SLOT_COUNT_Y))
#macro INVENTORY_BACKGROUND_X      (GUI_MIDDLE_X - ceil(INVENTORY_BACKGROUND_WIDTH / 2))
#macro INVENTORY_BACKGROUND_Y      (GUI_MIDDLE_Y - ceil(INVENTORY_BACKGROUND_HEIGHT / 2))

function draw_inventory() {
	draw_sprite_stretched(
		spr_gui_background, 0,
		INVENTORY_BACKGROUND_X, INVENTORY_BACKGROUND_Y,
		INVENTORY_BACKGROUND_WIDTH, INVENTORY_BACKGROUND_HEIGHT
	)
}

function toggle_inventory() {
	if (opened == true) {
		for (var _x = 0; _x < INVENTORY_SLOT_COUNT_X; _x++) {
			for (var _y = 0; _y < INVENTORY_SLOT_COUNT_Y; _y++) {
				var button_x = INVENTORY_BACKGROUND_X + GUI_BG_OFFSET + INVENTORY_MARGIN + ((INVENTORY_MARGIN + INVENTORY_SLOT_WIDTH) * _x)
				var button_y = INVENTORY_BACKGROUND_Y + GUI_BG_OFFSET + INVENTORY_MARGIN + ((INVENTORY_MARGIN + INVENTORY_SLOT_HEIGHT) * _y)
				var item_sprite = undefined
				try { item_sprite = inventory[_y * INVENTORY_BACKGROUND_Y + _x].sprite } catch (exception) {}
				array_push(_slot_instances, instance_create_layer( 
					button_x, button_y,
					"managers", obj_inventory_slot,
					{
						width: INVENTORY_SLOT_WIDTH, 
						height: INVENTORY_SLOT_HEIGHT,
						sprite: item_sprite,
					}
				))
			}
		}
	}
	else {
		array_map_ext(_slot_instances, function(element) { instance_destroy(element) })
		array_resize(_slot_instances, 0) 
	}
}