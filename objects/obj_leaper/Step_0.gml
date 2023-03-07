event_inherited();

switch(state){
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
		_speed = ENEMY_DEFAULT_SPEED
		sprite_index = agro_sprite
		if (agro == true) { 
			check_for_player()
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
		}
		if (collision_circle(x, y,leap_radius, obj_player, false, false)) {state = enemy_state.charging}
		if !(collision_circle(x, y, agro_radius, obj_player, false, false)) && (alarm[3] == -1) {alarm[3] = agro_timer }
		if (agro == false) {state = enemy_state.idle path_end()}
		break
	#endregion
	#region charging case
	case enemy_state.charging:
		path_end()
		sprite_index = charging_sprite
		leap_timer += 0.1
		if sprite_index == charging_sprite
		{_speed = 0}
		if leap_timer >= 8 {state = enemy_state.attacking}
		break
	#endregion
	#region attacking case
	case enemy_state.attacking:
		sprite_index = attacking_sprite
		//jump attack
		move_towards_point(obj_player.x, obj_player.y, 10)
		if place_meeting(x,y,obj_player) || place_meeting(x,y,obj_collision)
		{_speed = 0}
		if !(collision_circle(x, y, attack_radius, obj_player, false, false)) && alarm[4] == -1{
			alarm[4] = 60}
		break
	#endregion
}
 
 
 