if obj_crowbar.sprite_index == spr_crowbar_attack && _invincible = 0
{
	_dummy_health -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}