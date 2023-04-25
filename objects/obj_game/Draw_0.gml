if (global.pause == true) and (pause_sprite != -1) {
	show_debug_message(sprite_get_width(pause_sprite))
	show_debug_message(sprite_get_height(pause_sprite))
	draw_sprite(pause_sprite, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]))
}