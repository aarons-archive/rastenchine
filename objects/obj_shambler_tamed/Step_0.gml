enum shambler_tamed_state {
	waking,
	following,
	agro,
	attacking,
	death,
}

switch (state) {
	case shambler_tamed_state.waking:
		_speed = 0
		//sprite_index = spr_shambler_tamed_wake
		break
	case shambler_tamed_state.following:
		_speed = ENEMY_DEFAULT_SPEED
		if !collision_circle(obj_player.x,obj_player.y,follow_zone,self,false,false) {follow_player()}
		if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1} 
		break
	case shambler_tamed_state.agro:
		_speed = ENEMY_DEFAULT_SPEED
		sprite_index = spr_shambler_tame_agro
		check_for_enemy()
		if (obj_enemy.x < x) {image_xscale = -1} else {image_xscale = 1} 
		if (collision_rectangle(x-64, y-34,x+64,y+34, obj_enemy, false, false)) {state = shambler_tamed_state.attacking}
		break
	case shambler_tamed_state.attacking:
		_speed = 0
		sprite_index = spr_shambler_tame_attacking
		if image_index > 9 {state = shambler_tamed_state.agro}
		break
	case shambler_tamed_state.death:
		break
}