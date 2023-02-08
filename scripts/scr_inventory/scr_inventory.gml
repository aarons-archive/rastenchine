function Inventory() constructor {
	
	items = [new Crowbar(), new Plank(), new Gun()]
	item_index = 0
	item = items[item_index]
	
	item._instance = instance_create_layer(obj_player.x, obj_player.y, "instances", obj_item)
	item._instance.sprite_index = item._sprite

	static step = function() {
		if (is_instanceof(item, Weapon)) {
			item.attack()
		}
	}
	static draw = function() {
		item.draw()
	}
	static change_item = function(index) {
		// destroy old items instance
		instance_destroy(item._instance)
		// set new item
		var count = array_length(items)
		item_index = (index + count) % count
		item = items[item_index]
		// create new items instance
		item._instance = instance_create_layer(obj_player.x, obj_player.y, "instances", obj_item)
		item._instance.sprite_index = item._sprite
	}
 }
 
