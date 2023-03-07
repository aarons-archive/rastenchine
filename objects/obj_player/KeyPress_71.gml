var seno=dsin(point_direction(x,y,mouse_x,mouse_y));
var cose=dcos(point_direction(x,y,mouse_x,mouse_y));

var r = collision_line_point(x,y,x+(500*cose),y+(-500*seno), obj_player_collision, true, true);
draw_line_width_color(x, y, r[1], r[2],15,c_white,c_yellow);
if (r[0] != noone) {
    // r[0] holds the nearest (hit) instance.
}