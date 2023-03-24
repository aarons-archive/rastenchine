function get_inputs() {
	// movement
	if (movement_state != player_movement_state.dodging) {
		x_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
		y_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
	}
	// walking
	walk_input = ((x_input != 0) or (y_input != 0))
	// running
	run_input = keyboard_check(global.RUN_KEY)
	// dodging
	dodge_input = keyboard_check_pressed(global.DODGE_KEY)
	//selecting
	select_input = keyboard_check(global.SELECT_KEY)
}