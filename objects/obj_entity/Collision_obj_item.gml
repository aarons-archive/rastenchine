/// @description weapon damage

var item = obj_player.inventory.item

if ((invincible == false) && (is_instanceof(item, Weapon) == true) && (item.state == weapon_state.attacking)) {
	invincible = true

	alarm[6] = 30
	_health -= item.damage
	item.state = weapon_state.cooldown
}