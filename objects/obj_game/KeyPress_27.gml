/// @description Toggle Pause
global.paused = !global.paused

if (global.paused == true) {
	pause_sprite = sprite_create_from_surface(
		application_surface, 
		0, 0, 
		camera_get_view_width(view_camera[0]) * 2, camera_get_view_height(view_camera[0]) * 2, 
		false, false, 0, 0
	)
	instance_deactivate_all(true)
}
if (global.paused == false) {
	pause_sprite = sprite_delete(pause_sprite)
	instance_activate_all()
}
