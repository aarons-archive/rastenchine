event_inherited()

var within_agro_radius = collision_circle(x, y, agro_radius, obj_player, true, false) != noone
var within_leap_radius = collision_circle(x, y, attack_radius, obj_player, true, false) != noone

switch(state){
	#region idle case
	case enemy_state.idle:
		sprite_index = idle_sprite
		if (within_agro_radius) { state = enemy_state.agro }
		break
	#endregion
	
	#region agro case
	case enemy_state.agro:
		sprite_index = agro_sprite
		image_xscale = (obj_player.x < x) ? -1 : 1
		if (within_agro_radius) { alarm[3] = -1 } else if (not within_agro_radius) { alarm[3] = 120 }
	    if (within_leap_radius) { state = enemy_state.charging }
		check_for_player()
		break
	#endregion
	
	#region charging case
	case enemy_state.charging:
		sprite_index = charging_sprite
		
		break
	#endregion
	
	#region attacking case
	case enemy_state.attacking:
		sprite_index = attacking_sprite
		break
	#endregion
}
 
 
 