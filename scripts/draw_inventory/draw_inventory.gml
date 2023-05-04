#macro INVENTORY_PADDING (12)
#macro INVENTORY_MARGIN  (4)

#macro INVENTORY_SLOT_WIDTH   (32 + (INVENTORY_PADDING * 2))
#macro INVENTORY_SLOT_HEIGHT  (32 + (INVENTORY_PADDING * 2))
#macro INVENTORY_SLOT_COUNT_X (9)
#macro INVENTORY_SLOT_COUNT_Y (3)

#macro INVENTORY_BACKGROUND_WIDTH  ((GUI_BG_BORDER * 2) + INVENTORY_MARGIN + ((INVENTORY_SLOT_WIDTH + INVENTORY_MARGIN) * INVENTORY_SLOT_COUNT_X))
#macro INVENTORY_BACKGROUND_HEIGHT ((GUI_BG_BORDER * 2) + INVENTORY_MARGIN + ((INVENTORY_SLOT_HEIGHT + INVENTORY_MARGIN) * INVENTORY_SLOT_COUNT_Y))
#macro INVENTORY_BACKGROUND_X      (GUI_MIDDLE_X - ceil(INVENTORY_BACKGROUND_WIDTH / 2))
#macro INVENTORY_BACKGROUND_Y      (GUI_MIDDLE_Y - ceil(INVENTORY_BACKGROUND_HEIGHT / 2))

#macro HOTBAR_BACKGROUND_WIDTH  ((GUI_BG_BORDER * 2) + (INVENTORY_MARGIN * 2) + INVENTORY_SLOT_WIDTH)
#macro HOTBAR_BACKGROUND_HEIGHT (undefined)
#macro HOTBAR_BACKGROUND_X      (GUI_X1)
#macro HOTBAR_BACKGROUND_Y      (GUI_Y1)

#macro HOTBAR_SLOT_WIDTH  (INVENTORY_SLOT_WIDTH)
#macro HOTBAR_SLOT_HEIGHT (INVENTORY_SLOT_HEIGHT)
#macro HOTBAR_SLOT_X      (HOTBAR_BACKGROUND_X + GUI_BG_BORDER + INVENTORY_MARGIN)
#macro HOTBAR_SLOT_Y      (undefined)

function draw_inventory() {
	draw_sprite_stretched(
		GUI_BG_SPRITE, 0,
		INVENTORY_BACKGROUND_X, INVENTORY_BACKGROUND_Y,
		INVENTORY_BACKGROUND_WIDTH, INVENTORY_BACKGROUND_HEIGHT
	)
}

function show_inventory() {
	for (var _x = 0; _x < INVENTORY_SLOT_COUNT_X; _x++) {
		for (var _y = 0; _y < INVENTORY_SLOT_COUNT_Y; _y++) {
			var _inventory_index = _y * INVENTORY_SLOT_COUNT_X + _x 
			var _sprite = undefined
			try { _sprite = inventory[_inventory_index].DEFAULT_SPRITE } catch(error) {}
			array_push(_slot_instances, instance_create_layer( 
				INVENTORY_BACKGROUND_X + GUI_BG_BORDER + INVENTORY_MARGIN + ((INVENTORY_MARGIN + INVENTORY_SLOT_WIDTH) * _x),
				INVENTORY_BACKGROUND_Y + GUI_BG_BORDER + INVENTORY_MARGIN + ((INVENTORY_MARGIN + INVENTORY_SLOT_HEIGHT) * _y),
				"managers", 
				obj_inventory_slot,
				{
					width: INVENTORY_SLOT_WIDTH, 
					height: INVENTORY_SLOT_HEIGHT,
					sprite: _sprite,
					//inventory_index: _inventory_index,
					//hotbar_index: array_find_index(hotbar, _inventory_index)
				}
			))
		}
	}
}

function hide_inventory() {
	array_map_ext(_slot_instances, function(element) { instance_destroy(element) })
	array_resize(_slot_instances, 0) 
}

function draw_hotbar() {
	length = array_length(hotbar)
	draw_sprite_stretched(
		GUI_BG_SPRITE, 0,
		HOTBAR_BACKGROUND_X,
		HOTBAR_BACKGROUND_Y,
		HOTBAR_BACKGROUND_WIDTH,
		(GUI_BG_BORDER * 2) + INVENTORY_MARGIN + ((HOTBAR_SLOT_HEIGHT + INVENTORY_MARGIN) * length)
	)
	for (var i = 0; i < length; i++) {
		var slot_y = HOTBAR_BACKGROUND_Y + GUI_BG_BORDER + INVENTORY_MARGIN + ((HOTBAR_SLOT_HEIGHT + INVENTORY_MARGIN) * i)
		var colour = (i == index) ? (c_green) : (c_white)
		var _item = undefined
		try { _item = (hotbar[i] != undefined) ? (inventory[hotbar[i]]) : (undefined) } catch (error) {}
		draw_sprite_stretched_ext(
			GUI_BG_SPRITE, 0,
			HOTBAR_SLOT_X, slot_y,
			HOTBAR_SLOT_WIDTH, HOTBAR_SLOT_HEIGHT,
			colour, 1
		)
		if (_item != undefined) {
			draw_sprite(
				_item.DEFAULT_SPRITE, 0, 
				HOTBAR_SLOT_X + (HOTBAR_SLOT_WIDTH / 2),
				slot_y + (HOTBAR_SLOT_HEIGHT / 2)
			)
			draw_set_font(fnt_game)
			draw_set_halign(fa_right)
			draw_set_valign(fa_bottom)
			draw_text(
				HOTBAR_SLOT_X + HOTBAR_SLOT_WIDTH - GUI_BG_BORDER - 2,
				slot_y + HOTBAR_SLOT_HEIGHT - GUI_BG_BORDER + 3,
				string(_item.count)
			)
		}
	}
}