event_inherited();

#region chasing, hunting and attack
if ((collision_circle(x, y, _agro_radius, obj_player, false, false) && _health > 0) || _agro == true && _health > 0) {
	_agro = true
	sprite_index = spr_shambler
	if (_agro == true) {
		check_for_player()
		if (obj_player.x < x) { image_xscale = -1 }
		else { image_xscale = 1 } 
	}
	if (collision_circle(x, y,100, obj_player, false, false) && _health > 0) {
		if explode_timer >= 2 {explode_timer = 2} else {explode_timer += 0.1}
		sprite_index = spr_shambler_charging
		if sprite_index == spr_shambler_charging{_speed = 0} else _speed = ENEMY_DEFAULT_SPEED
		if explode_timer >= 2
		{
			sprite_index = spr_shambler_explode
			if image_index >= 6
			{
				instance_destroy();
			}
		}
	}
}

show_debug_message(image_index)
#endregion