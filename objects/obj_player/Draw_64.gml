draw_health_bar()
draw_stamina_bar()

if (DEBUG == true) {
	draw_debug()
}

draw_healthbar(
	bbox_left - 5,
	bbox_bottom + 5,
	bbox_right + 5,
	bbox_bottom + 10,
	_heal_counter, 
	c_black, c_white, c_red, 
	0, 
	false, false
)
