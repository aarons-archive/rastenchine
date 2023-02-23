event_inherited()

#region chasing, hunting and attack
if ((collision_circle(x, y, _agro_radius, obj_player, false, false) && _health > 0) || _agro == true && _health > 0) {
	_agro = true
	sprite_index = spr_enemy_chasing
	if (_agro == true) {
		check_for_player()
		if (obj_player.x < x) { image_xscale = -1 }
		else { image_xscale = 1 } 
	}
	if (collision_rectangle(x-64, y-34,x+64,y+34, obj_player, false, false) && _health > 0) {
		_speed = 0
		alarm[2] = 30
		sprite_index = spr_enemy_attack
	}
}
#endregion

/*
idle (move around naturally/smooth)
knockback(for when the player is hit and when the enemy is hit)
*/