function player_animation(){
var _aimdirection = point_direction(x, y, mouse_x, mouse_y);
if (walk_input == true) image_speed = 1;
else if (walk_input == false) image_speed = 0;
if (_aimdirection >= 315 || _aimdirection < 45)
{
	sprite_index = spr_player_side;
	image_xscale = 1;		
}
else if (_aimdirection >= 45 && _aimdirection < 135)
{
	sprite_index = spr_player_up;
	image_xscale = 1;		
}
else if (_aimdirection >= 135 && _aimdirection < 225)
{
	sprite_index = spr_player_side;
	image_xscale = -1;		
}
else if (_aimdirection >= 225 && _aimdirection < 315)
{
	sprite_index = spr_player_down;
	image_xscale = 1;		
}
}