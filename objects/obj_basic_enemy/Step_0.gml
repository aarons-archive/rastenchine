event_inherited()

switch (state) {
	#region idle case
	case enemy_state.idle:
		sprite_index = idle_sprite
		_speed = ENEMY_DEFAULT_SPEED
		if idle_movement = 0{
			x += _speed * irandom_range(-3, 3)
			y += _speed * irandom_range(-3, 3)
			idle_movement = 1
			alarm[1] = 60
		}
		if (collision_circle(x, y, agro_radius, obj_player, false, true)) {
			state = enemy_state.agro 
			agro = true} 
		break
	#endregion
	#region agro case
	case enemy_state.agro:
		image_speed = 1
		_speed = ENEMY_DEFAULT_SPEED
		sprite_index = spr_basic_enemy_chasing
		if (agro == true) { 
			check_for_player()
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
		} 
		if (collision_rectangle(x-64, y-34,x+64,y+34, obj_player, false, false)) {state = enemy_state.attacking}
		if !(collision_circle(x, y, agro_radius, obj_player, false, false)) && (alarm[3] == -1) {alarm[3] = agro_timer }
		if (agro == false) {state = enemy_state.idle path_end()}
		break
	#endregion
	#region attacking case
	case enemy_state.attacking:
		path_end()
		sprite_index = attacking_sprite	
		break
	#endregion
}
