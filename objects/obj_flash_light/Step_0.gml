x = obj_player.x
y = obj_player.y
image_angle = point_direction(x, y, mouse_x, mouse_y)

light[| eLight.X] = x
light[| eLight.Y] = y
light[| eLight.Direction] = image_angle
light[| eLight.Flags] |= eLightFlags.Dirty
