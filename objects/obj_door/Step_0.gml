player_is_near = distance_to_object(obj_player) <= 50
select_input = keyboard_check_pressed(global.OPEN_DOOR_KEY)

if (player_is_near == true and select_input == true) {
	if (toggle == true) {
		toggle = false
		if (object_index == obj_door_top) { image_angle = (obj_player.x > x) ? -90 : 90 }
		else if (object_index == obj_door_bottom) { image_angle = (obj_player.x > x) ? 90 : -90 }
		else if (object_index == obj_door_left) { image_angle = (obj_player.y > y) ? 90 : -90 }
		else if (object_index == obj_door_right) { image_angle = (obj_player.y > y) ? -90 : 90 }
	}
	else {
		toggle = true
		image_angle = 0
	}
}
