var item = obj_player.inventory.item
var tame = obj_tamed_shambler
var proj = other;

if (other.image_index == 1) && !(obj_pea_shooter.sprite_index == spr_pea_shooter_burrowed) {
	if (invincible == false) {
		state.change("hurt")
		_health -= 10
		invincible = true
		alarm[6] = 20
		if (item != Rifle) item.state = weapon_state.cooldown
		if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
		if instance_exists(obj_tamed_shambler){tame.target = self}
	}
}
