function do_animation() {
	image_speed = (walk_input == true) ? 1 : 0
	var aim_direction = point_direction(x, y, mouse_x, mouse_y)
	
	if (aim_direction >= 315 || aim_direction < 45) {
		sprite_index = spr_player_side
		image_xscale = 1
	}
	else if (aim_direction >= 45 && aim_direction < 135) {
		sprite_index = spr_player_up
		image_xscale = 1	
	}
	else if (aim_direction >= 135 && aim_direction < 225) {
		sprite_index = spr_player_side
		image_xscale = -1
	}
	else if (aim_direction >= 225 && aim_direction < 315) {
		sprite_index = spr_player_down
		image_xscale = 1	
	}
}