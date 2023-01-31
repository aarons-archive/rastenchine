if(state != STATES.hurt)
{
	image_speed = 1;
	_x = x + random_range(-96, 96);
	_y = y + random_range(-96, 96);
	
	// check wall x
	if(collision_line(x, y, _x, y, obj_collision, false, true))
	{
		_x = x;
	}
	
	// check wall y
	if(collision_line(x, y, x, _y, obj_collision, false, true))
	{
		_y = y;
	}
}
