if obj_weapon.sprite_index == spr_weapon_attack && _invincible = 0
{
	_speed = 0
	alarm[2] = 30
	sprite_index = spr_enemy; //hurt animation
	_hp -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}


