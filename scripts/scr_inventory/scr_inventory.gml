function Inventory() constructor {
	
	items = [new Crowbar(), new Gun(), new HealingPack()]
	item_index = 0
	item = items[item_index]
	
	item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item)
	item.instance.sprite_index = item.sprite

	static step = function() {
		item.common()
		if (is_instanceof(item, Weapon)) { item.attack() }
	}
	
	static change_item = function(index) {
		// don't do anything if the item is a weapon and is not idle
		if (is_instanceof(item, Weapon) && item.state != weapon_state.idle) { return }
		// destroy old item instance
		instance_destroy(item.instance)
		// set new item
		var count = array_length(items)
		item_index = (index + count) % count
		item = items[item_index]
		// create new item instance
		item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item)
		item.instance.sprite_index = item.sprite
	}
 }
 
