function Inventory() constructor {
	
	// list of Item subclasses
	items = [new Crowbar(), new Gun(), new HealingPack()]
	
	// list of references (by index) to 'items'
	hotbar = [1, 2, undefined]
	
	// reference (by index) to 'hotbar' of the currently held item
	hotbar_index = 0
	
	// currently selected item
	var item_index = hotbar[hotbar_index]
	item = (item_index != undefined) ? items[item_index] : undefined
	
	// initialization of item instance
	if (item != undefined) {
		item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item)
		item.instance.sprite_index = item.sprite
	}

	static step = function() {
		if (item != undefined) {
			item.common()
			if (is_instanceof(item, Weapon)) { item.attack() }
		}
	}
	
	static change_item = function(index) {
		
		// if there is an item...
		if (item != undefined) {
			// ...and it is a weapon that is not idle, don't allow the user to change items
			if (is_instanceof(item, Weapon) && item.state != weapon_state.idle) { return }
			// ...delete the items object instance
			instance_destroy(item.instance)
		}
		
		// set the new hotbar_index, using modulo to wrap the value around 
		var count = array_length(hotbar)
		hotbar_index = (index + count) % count
		
		// set new item
		var item_index = hotbar[hotbar_index]
		item = (item_index != undefined) ? items[item_index] : undefined
	
		// initialize item instance
		if (item != undefined) {
			item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item)
			item.instance.sprite_index = item.sprite
		}
	}
	
	static draw_hotbar = function() {
		var hotbar_length = array_length(hotbar)
		draw_sprite_stretched(
			spr_hotbar_background, 0,
			0, 0,
			5 + 50 + 5 + 3, 
			5 + (hotbar_length * 55) + 3
		)
		for (i = 0; i < hotbar_length; i++) {
			draw_sprite_stretched(
				spr_hotbar_foreground, 0,
				5, 
				5 + ((50 + 5) * i),
				50, 50,
			)
			var hotbar_item = (hotbar[i] != undefined) ? items[hotbar[i]] : undefined
			if (hotbar_item != undefined) {
				draw_sprite(
					hotbar_item.sprite, 0, 
					5 + (50 / 2),
					5 + ((50 + 5) * i) + 25,
				)
			}
		}
	}
 }
 
