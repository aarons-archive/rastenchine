function check_for_player() {
	var _dis = distance_to_object(obj_player)
	//can start chasing? or ready for attack
	if (_dis <= agro_radius && _dis > attack_radius) || agro == true{
		//should calc path?
		if (path_timer-- <= 0) {
			//reset timer
			path_timer = path_delay;
			//can make path to player
			if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, _type);
			//start path if can reach the player
			if (_found_player) {
				path_start(path, _speed, path_action_stop, false);
			}
		} 
		else if (_dis < obj_enemy) {
			path_end()
		}
	}
}

function check_for_path()
{
	if (path_timer-- <= 0) {
		path_timer = wander_delay;
		
		if (created_by_spawner) {
			wander_x = irandom_range(spawner_bbox_left - 100, spawner_bbox_right + 100)
			wander_y = irandom_range(spawner_bbox_top - 100, spawner_bbox_bottom + 100)
		}
		else {
			wander_x = irandom_range(bbox_left - 100, bbox_right + 100)
			wander_y = irandom_range(bbox_top - 100, bbox_bottom + 100)
		}
		var found_path = mp_grid_path(global.mp_grid, path, x, y, wander_x, wander_y, true)
		if (found_path) { path_start(path, _speed, path_action_stop, false) }
	} 
}


#region peashooter
function check_for_player_ranged() {
	var _dis = distance_to_object(obj_player);
	//can start chasing? or ready for attack
	if (_dis <= agro_radius && _dis > close_radius) || agro == true || !(state == enemy_state.attacking){
		//should calc path?
		if (path_timer-- <= 0) {
			//reset timer
			path_timer = path_delay;
			//can make path to player
			if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
			//start path if can reach the player
			if (_found_player) {path_start(path, _speed, path_action_stop, false)}
		}
			else if (_dis < close_radius) {
			path_end()
		}
	}
}
#endregion

#region tamed shambler stuff
function follow_player() {
	var _dis = distance_to_object(obj_player);
		//should calc path?
		if (path_timer-- <= 0) {
			path_timer = path_delay;
			if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
			//start path if can reach the player
			if (_found_player) {
				path_start(path, _speed, path_action_stop, false);
			}
		}
		if (_dis < follow_zone) {
			path_end()
		}
}

function check_for_enemy() {
	var _dis = distance_to_object(target);
	//can start chasing? or ready for attack
	if (_dis > attack_radius){
		//should calc path?
		if (path_timer-- <= 0) {
			path_timer = path_delay;
			if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, target.x, target.y, choose(0, 1));
			//start path if can reach the player
			if (_found_player) {
				path_start(path, _speed, path_action_stop, false);
			}
		} 
		else if (_dis < target) {
			path_end()
		}
	}
}
#endregion