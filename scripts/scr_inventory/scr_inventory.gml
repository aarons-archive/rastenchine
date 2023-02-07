function Item() constructor {}

function Weapon() : Item() constructor {
	
	_instance = undefined
	_sprite = undefined
	
	_center_y_offset = -8
	_center_y = obj_player.y + _center_y_offset
	_aim_dir = 0
	_weap_dis = 50
	_attack_cooldown = 0
	_damage = 5
	global._attack_damage = 0
	_attack_charger = 0
	_bullet_spread = 7
	
	static draw = function() {
		_center_y = obj_player.y + _center_y_offset
		_aim_dir = point_direction(obj_player.x, _center_y, mouse_x, mouse_y)
		_instance.depth = obj_player + (_aim_dir > 90 && _aim_dir < 270)
		if (!mouse_check_button_pressed(mb_left)) {
			_instance.image_angle = _aim_dir
		}
		_instance.x = obj_player.x + lengthdir_x(_weap_dis, _aim_dir)
		_instance.y = obj_player.y + lengthdir_y(_weap_dis, _aim_dir)
		_weap_dis = lerp(_weap_dis, 30, 0.1)
		_instance.image_yscale = (_aim_dir > 90 and _aim_dir < 270) ? -1 : 1


	}
}

function Crowbar() : Weapon() constructor {
	_sprite = spr_crowbar
	static attack = function() {
		weapon_attacks()
	}
}
function Plank() : Weapon() constructor {
	_sprite = spr_plank
	static attack = function() {
		// weapon_attacks()
	}
}
function Gun() : Weapon() constructor {
	_sprite = spr_gun
	static attack = function() {
		ranged_attacks()
	}
}

function Inventory() constructor {
	
	items = [new Crowbar(), new Plank(), new Gun()]
	selected_item = 0
	
	var item = items[selected_item]
	item._instance = instance_create_layer(obj_player.x, obj_player.y, "instances", obj_item)
	item._instance.sprite_index = items[selected_item]._sprite

	static draw = function() {
		items[selected_item].draw()
	}
	static step = function() {
		var _item = items[selected_item]
		if (is_instanceof(_item, Weapon)) {
			_item.attack()
		}
	}
	
	static change_item = function(index) {
		var count = array_length(items)
		instance_destroy(items[selected_item]._instance)
		selected_item = (index + count) % count
		items[selected_item]._instance = instance_create_layer(obj_player.x, obj_player.y, "instances", obj_item)
		items[selected_item]._instance.sprite_index = items[selected_item]._sprite
	}
 }
 
