if obj_enemy.sprite_index == spr_enemy_attack && _iframes = 0
{	
	_health -= global._enemy_damage
	_iframes = 1
	alarm[3] = 30
}