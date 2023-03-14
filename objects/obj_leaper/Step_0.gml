event_inherited();

switch(state){
	#region idle case
	case enemy_state.idle:
		sprite_index = idle_sprite
		if (collision_circle(x, y, agro_radius, obj_player))
		break
	#endregion
	
	#region agro case
	case enemy_state.agro:
		sprite_index = agro_sprite
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
 
 
 