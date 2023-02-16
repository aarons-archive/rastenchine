switch (state) {
	case player_states.idle:
		x_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
		y_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
		break
}

lighting()
run()
roll()
movement()
inventory.step()

if (x_input == 1) {
	image_angle = 0
	image_yscale = 1
}
if (x_input == -1) {
	image_angle = 180
	image_yscale = -1
}

