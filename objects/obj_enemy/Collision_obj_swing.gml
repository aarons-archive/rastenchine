if (invincible == true) { exit }

_health -= other.damage

invincible = true
alarm[6] = 20

state.change("hurt")

var tamed_shamblers = instances_of(obj_tamed_shambler)
for (var i = 0; i < array_length(tamed_shamblers); i++) {
	tamed_shamblers[i].state = shambler_tamed_state.agro
	tamed_shamblers[i].target = self
}
