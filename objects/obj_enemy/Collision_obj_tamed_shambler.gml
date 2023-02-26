var tame = obj_tamed_shambler

if ((invincible == false) && (obj_tamed_shambler.sprite_index == spr_tamed_shambler_attacking)) {
	invincible = true
	alarm[6] = 30
	_health -= tame.damage
}