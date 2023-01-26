function weapon_attacks() {
	_center_y = other.y + _center_y_offset
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
	
	if mouse_check_button_pressed(mb_left) && attack_cooldown = 0
	{
		attack_cooldown = 1
		alarm[2] = 30
		_weap.image_angle -= lerp(_aim_dir, _aim_dir + 45 , 1)
	}
}

function draw_my_weapon() {

	var _depth = (_aim_dir > 90 && _aim_dir < 270);
	_weap.depth = depth + _depth;
	if !mouse_check_button_pressed(mb_left) && attack_cooldown = 0
	{	
		_weap.image_angle = _aim_dir;
	}
	_weap.x = x + lengthdir_x(_weap_dis, _aim_dir);
	_weap.y = y + lengthdir_y(_weap_dis, _aim_dir);

	_weap_dis = lerp(_weap_dis, 30, 0.1);

	if _aim_dir > 90 && _aim_dir < 270 {
		_weap.image_yscale = -1
	} 
	else { 
		_weap.image_yscale = 1
	}
}
 