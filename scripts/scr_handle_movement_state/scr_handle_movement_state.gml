function handle_movement_state() {
	
	if ((stamina <= 0) and (movement_state != player_movement_state.dodging)) {
		movement_state = player_movement_state.exhausted
	}
	
	var should_walk = (walk_input == true)
	var should_run = ((run_input == true) and (stamina >= 1))
	var should_dodge = ((dodge_input == true) and (stamina >= PLAYER_DODGE_STAMINA_COST))

	switch (movement_state) {
		case player_movement_state.idle:
			if (should_walk == true) { movement_state = player_movement_state.walking }
			stamina = min(PLAYER_MAX_STAMINA, stamina + PLAYER_IDLE_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(_speed, PLAYER_IDLE_SPEED, 0.1)
			break
		
		case player_movement_state.walking:
			if (should_walk == false) { movement_state = player_movement_state.idle }
			else if (should_run == true) { movement_state = player_movement_state.running }
			else if (should_dodge == true) { movement_state = player_movement_state.dodging }
			stamina = min(PLAYER_MAX_STAMINA, stamina + PLAYER_WALK_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(_speed, PLAYER_WALK_SPEED, 0.1)
			break
		
		case player_movement_state.running:
			if (should_walk == false) { movement_state = player_movement_state.idle }
			else if (should_run == false) { movement_state = player_movement_state.walking }
			else if (should_dodge == true) { movement_state = player_movement_state.dodging }
			stamina = max(PLAYER_MIN_STAMINA, stamina - PLAYER_RUN_STAMINA_COST_PER_FRAME)
			_speed = lerp(_speed, PLAYER_RUN_SPEED, 0.1)
			break
		
		case player_movement_state.dodging:
			if (alarm[0] == -1) { 
				alarm[0] = PLAYER_DODGE_FRAMES 
				stamina = max(PLAYER_MIN_STAMINA, stamina - PLAYER_DODGE_STAMINA_COST)
				_speed = PLAYER_DODGE_SPEED
			}
			else {
				_speed = lerp(_speed, 0, 0.05)
			}
			break
		
		case player_movement_state.exhausted:
			stamina = min(PLAYER_MAX_STAMINA, stamina + PLAYER_EXHAUSTED_STAMINA_GAIN_PER_FRAME)
			_speed = lerp(_speed, PLAYER_EXHAUSTED_SPEED, 0.1)
			if (stamina >= PLAYER_EXHAUSTED_THRESHOLD) {
				movement_state = player_movement_state.idle
			}
			break
	}
}