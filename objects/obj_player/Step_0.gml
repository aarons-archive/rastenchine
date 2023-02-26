switch (state) {
	case player_states.idle:
		x_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
		y_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
		break
}

run()
roll()
movement()
inventory.step()
