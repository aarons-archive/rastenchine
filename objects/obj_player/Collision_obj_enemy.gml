if ((invincible == false) && (obj_enemy.sprite_index == spr_basic_enemy_attack)) {	
	invincible = true
	alarm[6] = 30
	_health -= global._enemy_damage
}

// long/easy way type all attack states per enemy
// move all attacking states to same position 
// long way that i dont remember
