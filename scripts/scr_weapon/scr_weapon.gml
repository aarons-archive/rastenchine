function weapon_attacks() {
	#region weapon rotation stuff
	_center_y = other.y + _center_y_offset
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
	#endregion
	//attack
	if _attack_charger >= 10 {_attack_charger = 10}
	if mouse_check_button(mb_left) && _attack_cooldown = 0 {
		obj_crowbar.sprite_index = spr_crowbar_charge_attack
		_attack_charger += 0.1
	} if mouse_check_button_released(mb_left) && _attack_charger > 1
	{
		obj_crowbar.sprite_index = spr_crowbar_attack
		_attack_cooldown = 1
		alarm[2] = 30
		global._attack_damage = _attack_charger * _damage + _damage
	} if mouse_check_button_pressed(mb_left) && _attack_cooldown = 0 && _attack_charger < 1
	{
		_attack_cooldown = 1
		alarm[2] = 30
		obj_crowbar.sprite_index = spr_crowbar_attack
	} 
}
function ranged_attacks()
{
	_center_y = other.y + _center_y_offset
	_aim_dir = point_direction(other.x, _center_y, mouse_x, mouse_y)
	_shoot_dir = _aim_dir + irandom_range(-_bullet_spread,_bullet_spread);
	var _xOffset = lengthdir_x(_center_y + _weap_dis,_shoot_dir);
	var _yOffset = lengthdir_y(_center_y + _weap_dis,_shoot_dir);
	if mouse_check_button_pressed(mb_left)
	{
		//create bullet
		var _dir = point_direction(x, y, mouse_x, mouse_y);
		var _bulletInst = instance_create_layer(x + _xOffset, y + _yOffset, "instances", obj_bullet);
		_bulletInst.speed = 3
		_bulletInst.image_angle = _dir
		_bulletInst.direction = _dir

	}

	//#region Shooting
	//if shootTimer > 0 shootTimer--;
//	if reloadTimer > 0 reloadTimer--;
//	if (shootKey && shootTimer <= 0 && clipAmmo > 0)
//	{
		//reset timer
//		shootTimer = shootCooldown;
		
		//remove ammo
//		clipAmmo -= 1;
		
/*	}
	else if (shootKey && shootTimer <= 0 && clipAmmo == 0)
	{
		reloading = true;	
	}
	if (reloadKey && clipAmmo < maxClip) reloading = true;
	
	if (reloading)
	{
		if reloadTimer = 0 reloadTimer = reloadLength;
		else if reloadTimer = 1
		{
			heldAmmo -= (maxClip - clipAmmo);
			clipAmmo = maxClip;
			reloading = false;
		}
	}*/
}
function draw_weapon() {
	var _depth = (_aim_dir > 90 && _aim_dir < 270);
	_weapon.depth = depth + _depth;
	if !mouse_check_button_pressed(mb_left){_weapon.image_angle = _aim_dir;}
	_weapon.x = x + lengthdir_x(_weap_dis, _aim_dir);
	_weapon.y = y + lengthdir_y(_weap_dis, _aim_dir);

	_weap_dis = lerp(_weap_dis, 30, 0.1);

	if _aim_dir > 90 && _aim_dir < 270 {_weapon.image_yscale = -1} 
	else {_weapon.image_yscale = 1}
}