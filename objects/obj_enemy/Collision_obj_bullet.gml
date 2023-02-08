if _invincible = 0
{
	_speed = 0
	alarm[2] = 30
	sprite_index = spr_enemy
	_hp -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}