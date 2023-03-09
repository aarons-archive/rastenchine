var item = obj_player.inventory.item
var tame = obj_tamed_shambler
var proj = other;
if (other.image_index == 1)
{
if (invincible == false) {
	invincible = true
	alarm[6] = 5
	_health -= item.damage
	if (item != Rifle) item.state = weapon_state.cooldown
	if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
	if instance_exists(obj_tamed_shambler){tame.target = self}
}
}