//if ((place_meeting(x, y, obj_flash_light) == true) or (place_meeting(x, y, obj_area_light) == true)) {
//	visible = true
//} 
//else {
//	visible = false
//}
audio_emitter_position(s_emit,x,y,0)
if (_health < 1) { state.change("death")}


within_attack_radius = (collision_circle(x, y, attack_radius, obj_player, true, false) != noone)
within_chase_radius = (collision_circle(x, y, chase_radius, obj_player, true, false) != noone)
within_vision_radius = (collision_circle(x, y, vision_radius, obj_player, true, false) != noone)

state.step()
depth = -(y / 10)

#region railgun shit
if instance_exists(obj_railgun_beam) {
	if (collision_line(obj_player.x, obj_player.y, obj_railgun_beam.r[1], obj_railgun_beam.r[2], self, 0, 0)) {
		if (invincible == true) { exit }
		_health -= obj_railgun_beam.damage
		invincible = true
		alarm[6] = 20
		state.change("hurt")
		var tamed_shamblers = instances_of(obj_tamed_shambler)
		for (var i = 0; i < array_length(tamed_shamblers); i++) {
			tamed_shamblers[i].state = shambler_tamed_state.agro
			tamed_shamblers[i].target = self
		}
	}
}
#endregion
