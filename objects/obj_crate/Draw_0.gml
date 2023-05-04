draw_self()

draw_healthbar(
	bbox_left - 3, bbox_top - 6, 
	bbox_right + 3, bbox_top - 3, 
	(_health / MAX_HEALTH) * 100, 
	c_black, c_red, c_red,
	0,
	true, false
)