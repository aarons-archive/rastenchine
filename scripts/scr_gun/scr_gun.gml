function Gun() : Weapon() constructor {
	
	_sprite = spr_gun
	
	static attack = function() {
		_center_y = obj_player.y + _center_y_offset
		_aim_dir = point_direction(obj_player.x, _center_y, mouse_x, mouse_y)
		_shoot_dir = _aim_dir + irandom_range(-_bullet_spread,_bullet_spread)

		if mouse_check_button_pressed(mb_left) {
			var _dir = point_direction(obj_item.x, obj_item.y, mouse_x, mouse_y)
			var _bulletInst = instance_create_layer(obj_item.x, obj_item.y, "instances", obj_item)
			_bulletInst.sprite_index = spr_bullet
			_bulletInst.speed = 3
			_bulletInst.image_angle = _dir
			_bulletInst.direction = _dir
		}
	}
}