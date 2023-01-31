if(target == noone)
{
	target = instance_find(obj_player, 0);
	return;
}

	if(state != STATES.death)
	{
		//random idle momvement
		x = lerp(x, _x, 0.02);
		y = lerp(y, _y, 0.02);
		if(distance_to_point(_x, _y) <= 3)
		{
			image_speed = lerp(image_speed, 0, 0.015);
			
			if(distance_to_point(_x, _y) <= 1)
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
	
	if(state == STATES.chasing) && (target != noone)
	{
		if (collision_circle(x, y, attack_radius, obj_player, false, true))
		{
			state = STATES.attacking;
			image_index = 0;
			move_towards_point(obj_player.x,obj_player.y,2)
		}
	}
	
if(_hp <= 0)
{
	state = STATES.death;
}

show_debug_message(state)

