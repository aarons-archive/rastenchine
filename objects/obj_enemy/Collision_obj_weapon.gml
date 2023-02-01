if obj_weapon.sprite_index == spr_weapon_attack && _invincible = 0
{
	//change state
	state = STATES.hurt;
	//reset frame number
	image_index = 0;
	//stop movement
	_x = x;
	_y = y;
	
	_hp -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}


