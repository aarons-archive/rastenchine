//if ((place_meeting(x, y, obj_flash_light) == true) or (place_meeting(x, y, obj_area_light) == true)) {
//	visible = true
//} 
//else {
//	visible = false
//}

if place_meeting(x,y,obj_player_collision)
{
	
}
if (_health < 1) { 
	state.change("death")
}

within_attack_radius = (collision_circle(x, y, attack_radius, obj_player, true, false) != noone)
within_chase_radius = (collision_circle(x, y, chase_radius, obj_player, true, false) != noone)
within_vision_radius = (collision_circle(x, y, vision_radius, obj_player, true, false) != noone)

state.step()


#region railgun shit
if instance_exists(obj_railgun_beam) {
	if (collision_line(obj_player.x,obj_player.y,obj_railgun_beam.r[1],obj_railgun_beam.r[2],self,0,0)) {
		var item = obj_player.inventory.item
		var tame = obj_tamed_shambler
		if (invincible == false) {
			invincible = true
			alarm[6] = 30
			_health -= item.damage
			item.state = weapon_state.cooldown
			if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
			if instance_exists(obj_tamed_shambler){tame.target = self}
		}
	}
}
#endregion

