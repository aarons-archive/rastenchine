function Weapon() : Item() constructor {
	
	_instance = undefined
	_sprite = undefined
	
	_center_y_offset = -8
	_center_y = obj_player.y + _center_y_offset
	_aim_dir = 0
	_weap_dis = 50
	
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