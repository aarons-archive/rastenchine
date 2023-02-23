#region death
if (_health < 1) {
	_speed = 0
	sprite_index = death_sprite
	if (image_index == 8) {
		instance_destroy()
	}
}
#endregion

#region idle
if (collision_circle(x, y, _vision_radius, obj_player, false, false) && _idle_movement == 0
	&& _health > 0 && !collision_circle(x, y, _agro_radius, obj_player, false, false)) {
	sprite_index = idle_sprite
	alarm[3] = 120
	_speed = ENEMY_DEFAULT_SPEED
	x += _speed * irandom_range(-3, 3)
	y += _speed * irandom_range(-3, 3)
	_idle_movement = 1
	alarm[1] = 60
}
#endregion