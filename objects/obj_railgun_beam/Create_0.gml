var seno = dsin(obj_player._direction)
var cose = dcos(obj_player._direction)

r = collision_line_point(obj_player._x, obj_player._y, obj_player._x + (500 * cose), obj_player._y + (-500 * seno), obj_player_collision, true, true)

maxdistance = distance_to_point(r[1], r[2]) + 12
distance = 0
angle = point_direction(obj_player._x, obj_player._y, r[1], r[2])
if (r[0] != noone) {}
lifetime = 20
