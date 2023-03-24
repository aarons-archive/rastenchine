if (distance_to_object(obj_player) < 40)
{
	selected = true;
}
else selected = false;
if selected == true
{
	gpu_set_fog(true, c_white, 0, 1000);
	draw_sprite_ext(sprite_index,image_index,x,y,1.1,1.1,image_angle,1,1);
	gpu_set_fog(false, c_white,0,1000);
}
else
{
	draw_sprite(sprite_index,image_index,x,y);
}


draw_self()
