#region health check
if(_hp <= 0)
{
	state = STATES.death;
}
#endregion

if collision_circle(x,y,_vision_radius,obj_player,false,false) 
{
	move_towards_point(obj_player.x,obj_player.y,_speed)
	sprite_index = spr_enemy_chasing
} else _idle_movement = 0 {
	x += _speed * choose(-2,2);
	y += _speed * choose(-2,2);
	_idle_movement = 1
	alarm[1] = 120
}

if collision_circle(x,y,_attack_radius,obj_player,false,false)
{
	_speed = 0
	sprite_index = spr_enemy_attack
}

show_debug_message(alarm[1])

/*
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
} else {image_speed = 1}
	
if(state == STATES.chasing) && (target != noone)
{
	move_towards_point(obj_player.x,obj_player.y,2)
	if (collision_circle(x, y, _attack_radius, obj_player, false, true))
	{
		state = STATES.attacking;
		image_index = 0;
	
	}
}