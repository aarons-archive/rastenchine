var _pan = min(pan_max, distance_to_point(mouse_x, mouse_y) / pan_scale)
var _direction = point_direction(follow.x, follow.y - PLAYER_ORIGIN_OFFSET, mouse_x, mouse_y)

x += ((follow.x + lengthdir_x(_pan, _direction)) - x) / 10
y += ((follow.y + lengthdir_y(_pan, _direction) - PLAYER_ORIGIN_OFFSET) - y) / 10

x = clamp(x, half_view_width, room_width - half_view_width)
y = clamp(y, half_view_height, room_height - half_view_height)

camera_set_view_pos(camera, x - half_view_width, y - half_view_height)
