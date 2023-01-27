if obj_weap.sprite_index == spr_attack && _invincible = 0
{
	_dummy_health -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}