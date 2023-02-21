if !(collision_point(x-lengthdir_x(push,point_direction(x,y,other.x,other.y)), y, obj_collision,false,true))
{
x -= lengthdir_x(push,point_direction(x,y,other.x,other.y));
}
if !(collision_point(x, y - lengthdir_y(push,point_direction(x,y,other.x,other.y)), obj_collision,false,true))
{
y-= lengthdir_y(push,point_direction(x,y,other.x,other.y));
}