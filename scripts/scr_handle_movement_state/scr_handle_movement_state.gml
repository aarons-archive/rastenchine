function handle_movement_state() {
	
	// TODO: maybe move this into the state machine itself? would only
	//       need to be in running i think 
	if ((stamina <= 0) and (movement_state != player_movement_state.dodging)) {
		movement_state = player_movement_state.exhausted
	}

	switch (movement_state) {
		case player_movement_state.idle:
			if (walk_input == true) { movement_state = player_movement_state.walking }
			_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
			stamina = min(PLAYER_MAX_STAMINA, stamina + IDLE_STAMINA_GAIN_PER_FRAME)
			break
		
		case player_movement_state.walking:
			if (walk_input == false) { movement_state = player_movement_state.idle }
			else if ((run_input == true) and (stamina >= 1)) { movement_state = player_movement_state.running }
			else if ((dodge_input == true) and (stamina >= DODGING_STAMINA_COST)) { movement_state = player_movement_state.dodging }
			_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.2)
			stamina = min(PLAYER_MAX_STAMINA, stamina + WALKING_STAMINA_GAIN_PER_FRAME)
			break
		
		case player_movement_state.running:
			if (walk_input == false) { movement_state = player_movement_state.idle }
			else if ((run_input == false) or (stamina <= 0)) { movement_state = player_movement_state.walking }
			else if ((dodge_input == true) and (stamina >= DODGING_STAMINA_COST)) { movement_state = player_movement_state.dodging }
			_speed = lerp(_speed, PLAYER_RUN_SPEED, 0.2)
		    stamina = max(PLAYER_MIN_STAMINA, stamina - RUNNING_STAMINA_COST_PER_FRAME)
			break
		
		case player_movement_state.dodging:
			movement_state = player_movement_state.idle
			//if (alarm[1] == -1) { alarm[1] = PLAYER_DODGE_FRAMES }
			//_speed = lerp(_speed, PLAYER_DODGE_SPEED, 0.2)
			//stamina = max(PLAYER_MIN_STAMINA, stamina - DODGING_STAMINA_COST)
			break
		
		case player_movement_state.exhausted:
			_speed = lerp(_speed, PLAYER_EXHAUSTED_SPEED, 0.2)
			stamina = min(PLAYER_MAX_STAMINA, stamina + EXHAUSTED_STAMINA_GAIN_PER_FRAME)
			if (stamina >= (PLAYER_MAX_STAMINA * 0.3)) {
				movement_state = player_movement_state.idle
			}
			break
	}
}