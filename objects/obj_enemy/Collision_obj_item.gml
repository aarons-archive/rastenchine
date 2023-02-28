var item = obj_player.inventory.item
var tame = obj_tamed_shambler

if ((invincible == false) && (is_instanceof(item, Weapon) == true) && (item.state == weapon_state.attacking)) {
	invincible = true

	alarm[6] = 30
	_health -= item.damage
	item.state = weapon_state.cooldown
	if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
	if instance_exists(obj_tamed_shambler){tame.target = self}
}