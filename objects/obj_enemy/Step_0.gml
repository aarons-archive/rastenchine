//lerp shit
if(state != STATES.death)
{
	x = lerp(x, xp, 0.02);
	y = lerp(y, yp, 0.02);
		
	if(distance_to_point(xp, yp) <= 3)
	{
		image_speed = lerp(image_speed, 0, 0.015);
		
		if(distance_to_point(xp, yp) <= 1)
		{
			if(alarm_get(1) <= -1)
			{
				alarm_set(1, room_speed * random_range(0.5, 1));
			}
		}
	}
} else {
	image_speed = 1;
}
//hitpoints
hitpoints_current = lerp(hitpoints_current, hitpoints_next, 0.2);