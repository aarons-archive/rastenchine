if point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) {
	_button_colour = HOVER_BUTTON_COLOUR
	if mouse_check_button(mb_left) {
		switch (element) {
			case MenuElement.RUN_SCRIPT:
				script_execute(arg0)
				break
			case MenuElement.CHANGE_PAGE:
				obj_menu.page = arg0
		}
	}
}
else {
	_button_colour = DEFAULT_BUTTON_COLOUR
}



