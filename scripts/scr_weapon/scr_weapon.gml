function weapon_attacks() {
	//attack
	if _attack_charger >= 10 {
		_attack_charger = 10
	}
	if (mouse_check_button(mb_left) && _attack_cooldown = 0) {
		_instance.sprite_index = spr_crowbar_charge_attack
		_attack_charger += 0.1
	} 
	if (mouse_check_button_released(mb_left) && _attack_charger > 1) {
		_instance.sprite_index = spr_crowbar_attack
		_attack_cooldown = 1
		obj_player.alarm[2] = 30
		global._attack_damage = _attack_charger * _damage + _damage
	} 
	if (mouse_check_button_pressed(mb_left) && _attack_cooldown = 0 && _attack_charger < 1) {
		_attack_cooldown = 1
		obj_player.alarm[2] = 30
		_instance.sprite_index = spr_crowbar_attack
	} 
}
function ranged_attacks()
{
	_center_y = obj_player.y + _center_y_offset
	_aim_dir = point_direction(obj_player.x, _center_y, mouse_x, mouse_y)
	_shoot_dir = _aim_dir + irandom_range(-_bullet_spread,_bullet_spread);

	if mouse_check_button_pressed(mb_left) {
		//create bullet
		var _dir = point_direction(obj_item.x, obj_item.y, mouse_x, mouse_y);
		var _bulletInst = instance_create_layer(obj_item.x, obj_item.y, "instances", obj_bullet);
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