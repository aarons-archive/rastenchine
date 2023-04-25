instance_x_offset = 0
instance_y_offset = -20
instance_offset = 16
_direction = point_direction(obj_player.x, obj_player.y, obj_crosshair.x, obj_crosshair.y)
xtest = obj_player.x - lengthdir_x(instance_offset, _direction) + instance_x_offset
ytest = obj_player.y - lengthdir_y(instance_offset, _direction) + instance_y_offset
draw_text(30,30,xtest);
draw_text(30,50,ytest);
