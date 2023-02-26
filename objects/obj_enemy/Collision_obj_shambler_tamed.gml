var tame = obj_shambler_tamed

if ((invincible == false) && (obj_shambler_tamed.sprite_index == spr_shambler_tame_attacking)) {
	invincible = true
	alarm[6] = 30
	_health -= tame.damage
}