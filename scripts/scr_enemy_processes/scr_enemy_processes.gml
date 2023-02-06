function CheckForPlayer()
{
	var _dis = distance_to_object(obj_player);
	
	//can start chasing? or ready for attack
	if _dis <= _agro_radius && _dis > _attack_radius {
		//should calc path?
		if _path_timer-- <= 0 {
			//reset timer
			_path_timer = _path_delay;
			//can make path to player
			if x == _x and y == _y var _type = 0 else var _type = 1;
			var _foundPlayer = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
			//start path if can reach the player
			if _foundPlayer
			{
				path_start(path, _speed, path_action_stop, false);
			}
		} else if _dis < _attack_radius {
		//is close enough to player?		
		path_end();
	}
}
}

function EnemyAnim(){
	switch(state)
	{
	case STATES.idle:
		sprite_index = s_idle;
	break;
	case STATES.chasing:
		sprite_index = s_walk;
	break;
	case STATES.attacking:
		sprite_index = s_attack;
	break;
	case STATES.death:
		sprite_index = s_dead;
	break;
	}
	//update previous position
	xp = x;
	yp = y;
}