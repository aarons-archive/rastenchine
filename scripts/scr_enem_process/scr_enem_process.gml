/*function checkFacing() {
	var _facing = sign(x - xp);
	if _facing != 0 facing = _facing;
}*/

function CheckForPlayer()
{
	var _dis = distance_to_object(obj_player);
	//can start chasing? or ready for attack
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis {
		//should calc path?
		if calc_path_timer-- <= 0 {
			//reset timer
			calc_path_timer = calc_path_delay;
			//can make path to player
			if x == xp and y == yp var _type = 0 else var _type = 1;
			var _foundPlayer = mp_grid_path(global.mp_grid, path, x, y, oSkeleton.x, oSkeleton.y, choose(0, 1));
	
			//start path if can reach the player
			if _foundPlayer
			{
				path_start(path, move_spd, path_action_stop, false);
			}
		}
	} else {
		//is close enough to player?
		if _dis <= attack_dis {
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
	case STATES.moving:
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