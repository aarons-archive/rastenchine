function do_animation() {
	image_speed = (walk_input == true) ? 1 : 0
	var aim_direction = point_direction(x, y, mouse_x, mouse_y)
		var _direction = point_direction(0, 0, x_input, y_input)
	var x_movement = lengthdir_x(_speed, _direction)
	var y_movement = lengthdir_y(_speed, _direction)
	if (movement_state == player_movement_state.dodging)
	{
		image_speed = 1;
		if (x_movement > 0) {
		sprite_index = spr_player_side_roll;
		image_xscale = 1;
		}
		else if (x_movement < 0) {
		sprite_index = spr_player_side_roll;
		image_xscale = -1;
		}
		else if (y_movement > 0) {
		sprite_index = spr_player_down_roll;
		image_xscale = 1;
		}
		else if (y_movement < 0) {
		sprite_index = spr_player_up_roll;
		image_xscale = 1;
		}
		if (image_index == 6) image_speed = 0;
	}
	else if ((aim_direction <= 45) or (aim_direction >= 315)) {
		sprite_index = spr_player_side;
		image_xscale = 1
		
	}
	else if ((aim_direction >= 45) and (aim_direction <= 135)) {
		sprite_index = spr_player_up
		image_xscale = 1	
	}
	else if ((aim_direction >= 135) and (aim_direction <= 225)) {
		sprite_index = spr_player_side
		image_xscale = -1
	}
	else if ((aim_direction >= 225) and (aim_direction <= 315)) {
		sprite_index = spr_player_down
		image_xscale = 1	
	}
}