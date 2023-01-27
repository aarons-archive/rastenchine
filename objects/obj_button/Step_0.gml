if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) {
	_button_colour = ACTIVE_BUTTON_COLOUR
	if mouse_check_button_pressed(mb_left) {
		switch (element) {
			case MenuElement.RUN_SCRIPT:
				script_execute(func, arg0, arg1)
				break
		}
	}
}
else {
	if (selected == true) {
		_button_colour = ACTIVE_BUTTON_COLOUR
	}
	else {
		_button_colour = DEFAULT_BUTTON_COLOUR
	}
}
