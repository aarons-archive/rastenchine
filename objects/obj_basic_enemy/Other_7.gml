event_inherited()
if (state == enemy_state.attacking) && (alarm[4] == -1)  {
	image_speed = 0 
	image_index = image_number - 1
	alarm[4] = 60}