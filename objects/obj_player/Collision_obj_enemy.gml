/// @description enemy damage

if ((invincible == false) && (obj_enemy.sprite_index == spr_basic_enemy_attack)) {	
	invincible = true
	alarm[6] = 30
	_health -= global._enemy_damage
}