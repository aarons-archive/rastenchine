do_movement(
	(keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)), 
	(keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY))
)
do_roll(keyboard_check(global.ROLL_KEY))

weapon_attacks()


//dodge roll
// lock movement
// move smoothly