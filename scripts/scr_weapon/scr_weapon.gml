function weapon_attacks() {
	//weapon rotation stuff
	_center_y = other.y + _center_y_offset
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
	//attack
	if _attack_charger >= 10
	{
		_attack_charger = 10	
	}
	if mouse_check_button(mb_left) && _attack_cooldown = 0 {
		obj_weap.sprite_index = spr_chargeattack
		_attack_charger += 0.1
	} if mouse_check_button_released(mb_left) && _attack_charger > 1
	{
		obj_weap.sprite_index = spr_attack
		_attack_cooldown = 1
		alarm[2] = 30
		global._attack_damage = _attack_charger * _damage + _damage
	} if mouse_check_button_pressed(mb_left) && _attack_cooldown = 0 && _attack_charger < 1
	{
		_attack_cooldown = 1
		alarm[2] = 30
		obj_weap.sprite_index = spr_attack
	} 
}

function draw_my_weapon() {
	var _depth = (_aim_dir > 90 && _aim_dir < 270);
	_weap.depth = depth + _depth;
	if !mouse_check_button_pressed(mb_left){_weap.image_angle = _aim_dir;}
	_weap.x = x + lengthdir_x(_weap_dis, _aim_dir);
	_weap.y = y + lengthdir_y(_weap_dis, _aim_dir);

	_weap_dis = lerp(_weap_dis, 30, 0.1);

	if _aim_dir > 90 && _aim_dir < 270 {_weap.image_yscale = -1} 
	else {_weap.image_yscale = 1}
}