event_inherited()

switch(state){
	#region idle case
	case enemy_state.idle:
		path_end()
		_speed = 0
		sprite_index = idle_sprite
		//first frame of wandering/idle sprite?
		if alarm[1] == -1 && agro == false { alarm[1] = 120 }
		if (collision_circle(x, y, agro_radius, obj_player, false, true)) {
			state = enemy_state.agro 
			agro = true} 
		break
	#endregion
	#region wandering case
	case enemy_state.wandering:
		_speed = 1
		sprite_index = idle_sprite//_wandering
		check_for_path()
		if (collision_circle(x, y, agro_radius, obj_player, false, true)) {
			state = enemy_state.agro 
			agro = true}
		break
	#endregion
	#region agro case
	case enemy_state.agro:
		_speed = ENEMY_DEFAULT_SPEED
		sprite_index = spr_pea_shooter_angry_burrowed
		if (agro == true) { 
			check_for_player_ranged()
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
		}
		if (collision_circle(x, y, attack_radius, obj_player, false, false)) {state = enemy_state.attacking}
		if !(collision_circle(x, y, agro_radius, obj_player, false, false)) && (alarm[3] == -1) {alarm[3] = agro_timer }
		if (agro == false) {state = enemy_state.idle path_end()}
		break
		#endregion
		#region attacking case
	case enemy_state.attacking:
		path_end()
		sprite_index = attacking_sprite
		if (shoot_cooldown == false) {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1} 
			var _direction = point_direction(x, y, obj_player.x, obj_player.y)
			instance_create_layer( x, y, "other", obj_pea_bullets, 
			{ speed: 10, direction: _direction, image_angle: _direction })
			shoot_cooldown = true
			alarm[0] = 60
		}
		if !(collision_circle(x, y, attack_radius, obj_player, false, false)) && alarm[4] == -1{
			alarm[4] = 60}
		break
		#endregion
}