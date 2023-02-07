function Item() constructor {}

function Weapon() : Item() constructor {
	_sprite = undefined
	_x = obj_player.x
	_y = obj_player.y
	_depth = obj_player.depth
	_image_angle = 0
	_image_y_scale = 1
	
	_center_y_offset = -8
	_center_y = obj_player.y + _center_y_offset
	_aim_dir = 0
	_weap_dis = 50
	_attack_cooldown = 0
	_damage = 5
	global._attack_damage = 0
	_attack_charger = 0
	_melee_activate = 1
	_range_activate = 0
	_bullet_spread = 7
	
	static draw = function() {
		_center_y = other.y + _center_y_offset
		_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
		_depth = obj_player + (_aim_dir > 90 && _aim_dir < 270)
		if (!mouse_check_button_pressed(mb_left)){
			_image_angle = _aim_dir
		}
		_x = obj_player.x + lengthdir_x(_weap_dis, _aim_dir)
		_y = obj_player.y + lengthdir_y(_weap_dis, _aim_dir)
		_weap_dis = lerp(_weap_dis, 30, 0.1)
		_image_y_scale = (_aim_dir > 90 and _aim_dir < 270) ? -1 : 1

		draw_sprite_ext(_sprite, 0, _x, _y, 1, _image_y_scale, _image_angle, c_white, 1)
	}
}

function Crowbar() : Weapon() constructor {
	_sprite = spr_crowbar
}
function Plank() : Weapon() constructor {
	_sprite = spr_plank
}
function Gun() : Weapon() constructor {
	_sprite = spr_gun
}

function Inventory() constructor {
	items = [new Crowbar(), new Plank(), new Gun()]
	selected_item = 0
	
	static draw_selected_item = function() {
		items[selected_item].draw()
	}
	
	static change_selected_item = function(index) {
		var count = array_length(items)
		selected_item = (index + count) % count
	}
 }
 
