if point_in_rectangle(mouse_x, mouse_y, X1, Y1, X2, Y2) {
	colour = c_green
	if mouse_check_button_pressed(mb_left) {
		switch (ACTION) {
			case MenuElementAction.run_script:
				script_execute(FUNCTION, ARG_0, ARG_1)
				break
		}
	}
}
else {
	if (SELECTED == true) { colour = c_green }
	else { colour = c_white }
}
