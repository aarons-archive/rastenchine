var _horizontal_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
var _vertical_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
do_movement(_horizontal_input, _vertical_input);
weapon_attacks();




	

//dodge roll
// lock movement
// move smoothly