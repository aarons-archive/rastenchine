function Gun() : Weapon() constructor {
	
	_sprite = spr_gun
	_reloading = false
	_bullets_max = 6
	_bullets = _bullets_max
	
	static alarm_one = function() {
		_reloading = false
		_bullets = _bullets_max
	}

	static attack = function() {
		_center_y = obj_player.y + _center_y_offset
		_aim_dir = point_direction(obj_player.x, _center_y, mouse_x, mouse_y)
		if (keyboard_check_pressed(ord("R"))) {
			_reloading = true
			_instance.alarm[1] = 120
		}
		if (mouse_check_button_pressed(mb_left) && _bullets > 0 && _reloading = false) {
			_bullets -= 1
			var _dir = point_direction(obj_item.x, obj_item.y, mouse_x, mouse_y)
			var _bulletInst = instance_create_layer(obj_item.x, obj_item.y, "instances", obj_bullet)
			_bulletInst.speed = 6
			_bulletInst.image_angle = _dir
			_bulletInst.direction = _dir
		}
	}
}