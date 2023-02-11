draw_self()
inventory.draw()

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
