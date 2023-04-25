/// @description Toggle Pause
global.pause = !global.pause

if (global.pause == false) {
	instance_activate_all()
	surface_free(pause_surface)
	pause_surface = undefined
}
