if ((other.sprite_index == spr_crowbar_attack || other.sprite_index == spr_bullet) && _invincible = 0) {
	_health -= global._attack_damage
	_invincible = 1
	alarm[0] = 30
}
