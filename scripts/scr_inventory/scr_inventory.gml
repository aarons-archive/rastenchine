function Inventory() constructor {
	
	inventory = [new AmmoBox(), new HealingPack(), new Crowbar(), new Gun(), new Railgun(), new Rifle(), new Shotgun()]
	hotbar = [0, 1, 2, 3, 4, 5, 6]
	index = 0
	item = undefined
	
	self.change_item(self.index)
	
	////////////////
	// management //
	////////////////
	
	static change_item = function(hotbar_index) {
		// clean up the current item
		if (self.item != undefined) {
			// disallow changing items if the current item is a non-idle weapon
			if ((is_instanceof(self.item, Weapon) == true) and (self.item.state != weapon_state.idle)) { 
				return 
			}
			// destroy the current items object instance
			instance_destroy(self.item.instance)
			self.item = undefined
		}
		// set the new index
		var count = array_length(self.hotbar)
		self.index = (hotbar_index + count) % count
		// set the new item
		var item_index = self.hotbar[self.index]
		if (item_index != undefined) {
			self.item = self.inventory[item_index]
			self.item.instance = instance_create_layer(obj_player.x, obj_player.y, "player", obj_item, { sprite_index: self.item.sprite })
		}
	}
	
	static add_item = function(struct) {
		// if the item being added is stackable, search for a 
		// matching item in the inventory. if one is found, add
		// the item being added's count to the item that was found's 
		// count and then return early to avoid duplication.
		if (struct.stackable == true) {
			for (var i = 0; i < array_length(self.inventory); i++) {
				if (instanceof(self.inventory[i]) == instanceof(struct)) { 
					self.inventory[i].count += struct.count
					return
				}
			}
		}
		// search the inventory for an instance of 'undefined'. 
		// if found: replace it with the item being added.
		// if not found: add the item to the end of the inventory.
		var inventory_index = array_get_index(self.inventory, undefined)
		if (inventory_index != 1) {
			self.inventory[inventory_index] = struct
		}
		else {
			array_push(self.inventory, struct)
			inventory_index = array_length(self.inventory) - 1
		}
		// if the current hotbar slot is empty, replace it with the 
		// index of the item that was added. 
		if (self.hotbar[self.index] == undefined) {
			self.hotbar[self.index] = inventory_index
			self.change_item(self.index)
		}
		// if it is not empty, search the hotbar for an instance of 
		// 'undefined' and if found, replace it with the index of the 
		// item that was added.
		else {
			var hotbar_index = array_get_index(self.hotbar, undefined)
			if (hotbar_index != -1) {
				self.hotbar[hotbar_index] = inventory_index
			}
		}
	}
		
	static drop_item = function(item_index) {
		// make sure the index of the item being dropped is valid
		if ((item_index < 0) or (item_index >= array_length(self.inventory))) {
			return
		}
		// get the item that is to be dropped
		var _item = self.inventory[item_index]
		if ((is_instanceof(_item, Weapon) == true) and (_item.state != weapon_state.idle)) { 
			return 
		}
		// create a pickup instance with the items data
		instance_create_layer(
			_item.instance.x, _item.instance.y, 
			"pickups", obj_pickup, 
			{ 
				sprite_index: _item.sprite,
				image_angle: _item.instance.image_angle,
				image_yscale: _item.instance.image_yscale,
				struct: _item
			}
		)
		// remove the old item
		instance_destroy(_item.instance)
		self.item = undefined
		self.inventory[item_index] = undefined
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
			self.change_item(self.index - 1) 
		}
		else if (mouse_wheel_down() == true) { 
			self.change_item(self.index + 1) 
		}
		///////////////////////////////
		// number key item selection //
		///////////////////////////////
		for (var i = 0; i < array_length(self.hotbar); i++) {
			if ((keyboard_check_pressed(ord(string(i + 1))) == true) and (self.index != i)) { 
				self.change_item(i) 
			}
		}
		////////////////////
		// drop held item //
		////////////////////
		var item_index = self.hotbar[self.index]
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
 
