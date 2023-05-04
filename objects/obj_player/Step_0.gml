depth = -(y / 10)

_x = x
_y = y - PLAYER_ORIGIN_OFFSET
_direction = point_direction(_x, _y, mouse_x, mouse_y)

get_inputs()
handle_movement_state()
do_movement()
do_animation()

inventory.step()
