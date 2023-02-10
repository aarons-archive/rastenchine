var item = obj_player.inventory.item

if (is_instanceof(item, Weapon) && item.state == weapon_state.attacking) {
	_health -= item.damage
	invincible = true
	alarm[0] = 30
	item.state = weapon_state.cooldown
}