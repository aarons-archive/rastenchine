position_bar_y = lerp(position_bar_y, position_bar_y_end, 0.2);

if(abs(position_bar_y - position_bar_y_end) <= 20) 
{
	can_display_text = true;	
}

if (can_display_text)
{
	if (!is_waiting_for_keypress)
	{
			character_index += 0.25;
			
			if(keyboard_check_released(vk_anykey)) {
				character_index = string_length(dialog_get_text());	
			}
			
		if (character_index >= string_length(dialog_get_text())) is_waiting_for_keypress = true;
	}
	else
	{
		if(keyboard_check_released(vk_anykey)) {
			is_waiting_for_keypress = false;
			character_index = 0;
			
			dialog_next();
			
			if(dialog_end()) {
				obj_camera.follow = obj_player;
				obj_camera.pan_enabled = true;
				//make player move again
				instance_destroy();
			}
		}
	}
	
}
