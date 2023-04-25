/// @description Toggle Pause
global.pause = !global.pause

if (global.pause == true) {
	pause_sprite = sprite_create_from_surface(
		application_surface, 
		0, 0, 
		camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 
		false, false, 0, 0
	)
	instance_deactivate_all(true)
}
if (global.pause == false) {
	sprite_delete(pause_sprite)
	pause_sprite = -1
	instance_activate_all()
}
