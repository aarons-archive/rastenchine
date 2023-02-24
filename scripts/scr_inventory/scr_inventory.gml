function Inventory() constructor {
	
	items = [new Crowbar(), new Gun(), new HealingPack()]
	
	hotbar = [1, 2, undefined]
	index = 0
	
	item = (hotbar[index] != undefined) ? items[hotbar[index]] : undefined
	
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
	
	static change_item = function(_index) {
		if (item != undefined) {
			if (is_instanceof(item, Weapon) && item.state != weapon_state.idle) { return }
			instance_destroy(item.instance)
		}
		
		var count = array_length(hotbar)
		index = (_index + count) % count
		item = (hotbar[index] != undefined) ? items[hotbar[index]] : undefined
		
		if (item != undefined) {
			item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item)
			item.instance.sprite_index = item.sprite
		}
	}
	
	static draw_hotbar = function() {
		var hotbar_length = array_length(hotbar)
		//draw_roundrect_color_ext(
			
		//)
		
		for (i = 0; i < hotbar_length; i++) {
			var hotbar_item = items[i]
			
		}
	}
 }
 
