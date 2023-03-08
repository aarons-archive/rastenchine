event_inherited()

switch (state) {
	#region idle case
	case enemy_state.idle:
		sprite_index = idle_sprite
		//first frame of wandering/idle sprite?
		if alarm[1] = -1 {alarm[1] = 120 }
		if (collision_circle(x, y, agro_radius, obj_player, false, true)) {
			state = enemy_state.agro 
			agro = true} 
		break
	#endregion
	#region wandering case
	case enemy_state.wandering:
		_speed = 1
		sprite_index = spr_basic_enemy_chasing
		Goalx=irandom_range (obj_enemy_spawner.x-100,obj_enemy_spawner.x+100);
		Goaly=irandom_range (obj_enemy_spawner.y-100,obj_enemy_spawner.y+100);
		if point_in_circle(Goalx,Goaly,obj_enemy_spawner.x,obj_enemy_spawner.y,200){
			move_towards_point(Goalx,Goaly,_speed)
			if distance_to_point(Goalx,Goaly) < 1 {state = enemy_state.idle _speed = 0 }
		} else {_speed = 0}
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

//idle completely not moving
//wandering moving around randomly around their spawn zone
//agro runs toward player
//attacking swips at player then backs up a bit
//death plays animation and then destroys instance