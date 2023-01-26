do_run()
do_roll()
do_movement(
	(keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)), 
	(keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY))
)

weapon_attacks()