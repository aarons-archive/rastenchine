dir = point_direction(obj_player.x,obj_player.y,obj_crosshair.x,obj_crosshair.y);
with (obj_player)
{
	obj_camtilt.len = distance_to_object(obj_crosshair) / obj_camtilt.len_multi;
}
if (len > len_max) len = len_max;
x = obj_player.x + lengthdir_x(len,dir);
y = (obj_player.y-20) + lengthdir_y(len,dir);