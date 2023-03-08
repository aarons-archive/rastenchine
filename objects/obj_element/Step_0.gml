if point_in_rectangle(mouse_x, mouse_y, X1, Y1, X2, Y2) {
	_colour = UI_BG_ACTIVE_COLOUR
	if mouse_check_button_pressed(mb_left) {
		switch (ACTION) {
			case menu_element_action.run_script:
				script_execute(FUNCTION, ARG_0, ARG_1)
				break
		}
	}
}
else {
	if (SELECTED == true) {
		_colour = UI_BG_ACTIVE_COLOUR
	}
	else {
		_colour = UI_BG_COLOUR
	}
}
