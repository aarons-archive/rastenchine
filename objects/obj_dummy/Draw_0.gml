draw_self()

draw_healthbar(
	bbox_left - 5,
	bbox_top - 15,
	bbox_right + 5,
	bbox_top - 10,
	_health,
	c_black, c_red, c_red,
	0,
	true, true
)

if (DEBUG == true) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_color(
		bbox_left + (sprite_width / 2), 
		bbox_top - 30,
		string(_health) + "/" + string(DUMMY_MAX_HEALTH), 
		c_white, c_white, c_white, c_white,
		1
	)
}