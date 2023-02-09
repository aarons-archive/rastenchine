#region death
if (_hp < 1) {
	_speed = 0
	sprite_index = spr_enemy_death
	if (image_index == 8) {
		instance_destroy()
	}
}
#endregion

#region idle
if ( collision_circle(x, y, _vision_radius, obj_player, false, false) && _idle_movement = 0 && 
	_hp > 0 && !collision_circle(x, y, _agro_radius, obj_player, false, false))
{
	sprite_index = spr_enemy
	alarm[3] = 120
	_speed = SPEED_MAX
	x += _speed * irandom_range(-3,3)
	y += _speed * irandom_range(-3,3)
	_idle_movement = 1
	alarm[1] = 60
}
#endregion
#region Chasing/hunting and attack
if (collision_circle(x, y, _agro_radius, obj_player, false, false) && _hp > 0) || _agro == true && _hp > 0
{
	_agro = true
	sprite_index = spr_enemy_chasing
	if _agro == true
	{
		check_for_player()
		if obj_player.x < x {image_xscale = -1 }
		else{image_xscale = 1} 
	}
	#region attacking
	if (collision_circle(x, y, _attack_radius, obj_player, false, false) && _hp > 0) {
		_speed = 0
		alarm[2] = 30
		sprite_index = spr_enemy_attack
	}
	#endregion
}
#endregion

/*
idle (move around naturally/smooth)
collisions(dont walk through walls to get to player)
knockback(for when the player is hit and when the enemy is hit)
*/