var _horizontal_input = keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)
var _vertical_input = keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY)
do_movement(_horizontal_input, _vertical_input);

centerY = y + centerYOffset;
_aim_dir = point_direction(x, centerY, mouse_x, mouse_y);
