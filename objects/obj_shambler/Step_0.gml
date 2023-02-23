enum shambler_state {
	idle,
	agro,
	charging,
	attacking,
	death
}

switch (state) {
	case shambler_state.idle:
		if (collision_circle(x, y, vision_radius, obj_player, false, false) && idle_movement == 0 && _health > 0
			&& !collision_circle(x, y, agro_radius, obj_player, false, false)) {
			sprite_index = idle_sprite
			alarm[3] = 120
			_speed = ENEMY_DEFAULT_SPEED
			x += _speed * irandom_range(-3, 3)
			y += _speed * irandom_range(-3, 3)
			idle_movement = 1
			alarm[1] = 60
			if ((collision_circle(x, y, agro_radius, obj_player, false, false) && _health > 0) || agro == true && _health > 0) {} 
			break
		}	
	case shambler_state.agro:
		{
		agro = true
		sprite_index = spr_shambler
		if (agro == true) {
			check_for_player()
			if (obj_player.x < x) { image_xscale = -1 }
			else { image_xscale = 1 } 
	}
		break
	case shambler_state.charging
		if (collision_circle(x, y,100, obj_player, false, false) && _health > 0) {	
		sprite_index = spr_shambler_charging}
		break
	case shambler_state.attacking:
	
		if sprite_index == spr_shambler_charging{_speed = 0} else {_speed = ENEMY_DEFAULT_SPEED}
		if explode_timer >= 4 {
		sprite_index = spr_shambler_explode
		if image_index >= 5 {instance_destroy()}}} else {explode_timer += 0.1}
		break
	
	case shambler_state.death
		break
}

#region chasing, hunting and attack

	
}


show_debug_message(explode_timer)
#endregion
