function Inventory() constructor {
	
	items = [new AmmoBox(), new AmmoBox()]
	hotbar = [0, 1, 2, 3, 4]
	hotbar_index = 0
	item = undefined
	
	self.change_item(self.hotbar_index)
	
	////////////////
	// management //
	////////////////
	
	static change_item = function(_hotbar_index) {
		///////////////////////////////
		// clean up the current item //
		///////////////////////////////
		if (self.item != undefined) {
			// disallow changing items if the current item is a non-idle weapon
			if ((is_instanceof(self.item, Weapon) == true) and (self.item.state != weapon_state.idle)) { 
				return 
			}
			// destroy the current items object instance
			instance_destroy(self.item.instance)
			self.item = undefined
		}
		///////////////////////
		// set the new index //
		///////////////////////
		var count = array_length(self.hotbar)
		self.hotbar_index = (_hotbar_index + count) % count
		//////////////////////
		// set the new item //
		//////////////////////
		var item_index = self.hotbar[self.hotbar_index]
		if (item_index != undefined) {
			self.item = self.items[item_index]
			self.item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item, { sprite_index: self.item.sprite })
		}
	}
	
	static add_item = function(struct) {
		for (var i = 0; i < array_length(self.items); i++) {
			if (instanceof(self.items[i]) == instanceof(struct)) { 
				self.items[i].count += struct.count
				break
			}
		}
		
		if (struct.stackable == true) {
			for (var i = 0; i < array_length(self.items); i++) {
				if (instanceof(self.items[i]) == instanceof(struct)) { 
					self.items[i].count += struct.count
					break
				}
			}
		}
		else { 
			for (var i = 0; i < array_length(self.items); i++) {
				if self.items[i] == undefined {
					self.items[i] = struct
					for (var j = 0; j < array_length(self.hotbar); j++) {
						if self.hotbar[j] == undefined {
							self.hotbar[j] = i
							self.change_item(j)
							break
						}
					}
					break
				}
			}
		}
		
	}
		
	static drop_item = function(item_index) {
		// make sure the index of the item being dropped is valid
		if ((item_index < 0) or (item_index >= array_length(self.items))) {
			return
		}
		// get the item that is to be dropped
		var _item = self.items[item_index]
		if ((is_instanceof(_item, Weapon) == true) and (_item.state != weapon_state.idle)) { 
			return 
		}
		// create a pickup instance with the items data
		instance_create_layer(
			_item.instance.x, _item.instance.y, 
			"player", obj_pickup, 
			{ 
				sprite_index: _item.sprite,
				image_angle: _item.instance.image_angle,
				image_yscale: _item.instance.image_yscale,
				depth: obj_player.depth + 1,
				struct: _item
			}
		)
		// remove the old item
		instance_destroy(_item.instance)
		self.item = undefined
		self.items[item_index] = undefined
		// remove the hotbar reference
		for (var i = 0; i < array_length(self.hotbar); i++) {
			if (self.hotbar[i] == item_index) {
				self.hotbar[i] = undefined
				break
			}
		}
	}
		
	////////////
	// events //
	////////////

	static step = function() {
		////////////////////////////////
		// mouse wheel item selection //
		////////////////////////////////
		if (mouse_wheel_up() == true) { 
			self.change_item(self.hotbar_index - 1) 
		}
		else if (mouse_wheel_down() == true) { 
			self.change_item(self.hotbar_index + 1) 
		}
		///////////////////////////////
		// number key item selection //
		///////////////////////////////
		for (var i = 0; i < array_length(self.hotbar); i++) {
			if ((keyboard_check_pressed(ord(string(i + 1))) == true) and (self.hotbar_index != i)) { 
				self.change_item(i) 
			}
		}
		////////////////////
		// drop held item //
		////////////////////
		var item_index = self.hotbar[self.hotbar_index]
		if ((keyboard_check_pressed(global.DROP_ITEM_KEY) == true) and (item_index != undefined)) {
			self.drop_item(item_index)
		}
		//////////////////
		// item actions //
		//////////////////
		if (self.item != undefined) {
			self.item.common()
			self.item.use()
		}
	}
	
	static draw = function() { 
		draw_hotbar() 
	}
 }
 
