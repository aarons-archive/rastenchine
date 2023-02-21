/// @description weapon damage

var item = obj_player.inventory.item

if ((invincible == false) && (is_instanceof(item, Weapon) == true) && (item.state == weapon_state.attacking)) {
	invincible = true
	_speed = -ENEMY_DEFAULT_SPEED
	alarm[6] = 30
	_health -= item.damage
	item.state = weapon_state.cooldown
}