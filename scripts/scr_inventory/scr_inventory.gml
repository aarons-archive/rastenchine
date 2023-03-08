function Inventory() constructor {
	
	// list of 'Item' subclasses; 
	items = [new Crowbar(), new Gun(), new Shotgun(), new Railgun(), new Rifle()]
	// items in the hotbar as a list of references (by index) to 'items'.
	hotbar = [0, 1, 2, 3, 4,]
	// current item as a reference (by index) to 'hotbar'.
	hotbar_index = 0
	// current item
	item = undefined

	static initialise_item = function() {
		// get the index of the current item from the current hotbar slot.
		var item_index = hotbar[hotbar_index]
		// if the slot was not empty..
		if (item_index != undefined) {
			// ..get the item and set it as a variable of the Inventory.
			item = items[item_index]
			// ..create an instance of obj_item using its sprite.
			item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item, { sprite_index: item.sprite})
		}
		else {
			// ..set the current item as undefined which does nothing.
			item = undefined
		}
	}
	initialise_item()
	
	static change_item = function(index) {
		// if an item is selected..
		if (item != undefined) {
			// ..and it is a weapon that is not idle, don't allow the player to change item.
			if (is_instanceof(item, Weapon) && item.state != weapon_state.idle) { 
				return 
			}
			// ..delete its object instance.
			instance_destroy(item.instance)
		}
		// set the new hotbar_index, using modulo to wrap the value if needed.
		var count = array_length(hotbar)
		hotbar_index = (index + count) % count
		// initialize the new item.
		initialise_item()
	}

	static step = function() {
		// handle the player using the mouse wheel for hotbar selection.
		if (mouse_wheel_up()) { 
			change_item(hotbar_index - 1) 
		}
		else if (mouse_wheel_down()) { 
			change_item(hotbar_index + 1)
		}
		// handle the player using the number keys for hotbar selection.
		for (var i = 0; i < array_length(hotbar); i++) {
			if ((keyboard_check_pressed(ord(string(i + 1))) == true) and (hotbar_index != i)) { 
				change_item(i) 
			}
		}
		// perform item actions if one is selected.
		if (item != undefined) {
			item.common()
			item.use()
		}
	}
	
	static draw = function() { 
		draw_hotbar() 
	}
 }
 
