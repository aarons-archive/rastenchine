/// @description bullet damage

var item = obj_player.inventory.item

if (invincible == false) {
	invincible = true
	alarm[6] = 30
	_health -= item.damage
	item.state = weapon_state.cooldown
}