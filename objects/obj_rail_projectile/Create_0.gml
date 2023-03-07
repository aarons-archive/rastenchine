var seno=dsin(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
var cose=dcos(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
r = collision_line_point(obj_player.x,obj_player.y,obj_player.x+(500*cose),obj_player.y+(-500*seno), obj_player_collision, true, true);
maxdistance = distance_to_point(r[1], r[2]) + 12; //distance to collided point in line
distance = 0;
angle = point_direction(obj_player.x,obj_player.y,r[1],r[2]);
	if (r[0] != noone) {
    // r[0] holds the nearest (hit) instance.
}
lifetime = 30;