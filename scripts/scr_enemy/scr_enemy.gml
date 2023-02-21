function check_for_player() {
	var _dis = distance_to_object(obj_player);
	//can start chasing? or ready for attack
	if (_dis <= _agro_radius && _dis > _attack_radius) || _agro == true{
		//should calc path?
		if (_path_timer-- <= 0) {
			//reset timer
			_path_timer = _path_delay;
			//can make path to player
			if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
			//start path if can reach the player
			if (_found_player) {
				path_start(path, _speed, path_action_stop, false);
			}
		} 
		//is close enough to player?	
		else if (_dis < obj_enemy) {
			path_end()
		}
	}
}

enum enemy_states {
	idle,
	chasing,
	hurt,
	death,
	attacking
}

function enemy_animation(){
	switch(state) {
		case enemy_states.idle:
			sprite_index = s_idle
			break
		case enemy_states.chasing:
			sprite_index = s_walk
			break
		case enemy_states.attacking:
			sprite_index = s_attack
			break
		case enemy_states.death:
			sprite_index = s_dead
			break
	}
	xp = x
	yp = yp
}