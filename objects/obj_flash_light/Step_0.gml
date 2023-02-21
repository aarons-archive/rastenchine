x = obj_player.x
y = obj_player.y

var _direction = point_direction(x, y, mouse_x, mouse_y)

light[| eLight.X] = x
light[| eLight.Y] = y
light[| eLight.Direction] = _direction
light[| eLight.Flags] |= eLightFlags.Dirty
