event_inherited()


switch (state) {
	#region sleeping case
	case enemy_state.sleeping:
		_speed = 0
		sprite_index = spr_shambler_sleeping
		if (collision_circle(x, y, vision_radius, obj_player, false, false)) && obj_player._speed > 4 {state = enemy_state.agro }
		//will also need cheese item + must be crouching?
		if (collision_circle(x, y, 50, obj_player, false, false)) && keyboard_check_pressed(ord("E")){
		instance_create_layer(x,y,"other",obj_tamed_shambler)
		instance_destroy()
		}
		break
	#endregion
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
			if (collision_circle(x, y, agro_radius, obj_player, false, false)) {
				state = enemy_state.agro 
				agro = true} 
			break
	#endregion
	#region agro case
	case enemy_state.agro:
		_speed = ENEMY_DEFAULT_SPEED
		sprite_index = spr_shambler
		if (agro == true) {
			check_for_player()
			if (obj_player.x < x) { image_xscale = -1 } else { image_xscale = 1 } 
		}
		if !(collision_circle(x, y, agro_radius, obj_player, false, false)) && (alarm[3] == -1) {alarm[3] = agro_timer }
		if (agro == false) {state = enemy_state.idle path_end()}
		if (collision_circle(x, y,100, obj_player, false, false)) {state = enemy_state.charging}
		break
	#endregion
	#region charging case
	case enemy_state.charging:
		sprite_index = spr_shambler_charging
		explode_timer += 0.1
		if sprite_index == spr_shambler_charging{_speed = 0}
		if !(collision_circle(x, y,100, obj_player, false, false)){
			_speed = ENEMY_DEFAULT_SPEED 
			explode_timer = 0 
			state = enemy_state.agro
			agro = true
			}
		if explode_timer >= 8 {state = enemy_state.attacking}
		break
	#endregion
	#region attacking case
	case enemy_state.attacking:
		sprite_index = attacking_sprite
		if image_index >= 5 {instance_destroy()}
		break
	#endregion
}