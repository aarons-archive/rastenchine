function menu_draw_page() {
	draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_page()
	if (selected_sub_page != undefined) { 
		draw_sub_page() 
	}
}

function calculate_element_y1(element_count, current) {
	var menu_height = ((MENU_ELEMENT_HEIGHT * element_count) + (MENU_ELEMENT_MARGIN * (element_count - 1))) / 2
	var offset = (MENU_ELEMENT_HEIGHT + MENU_ELEMENT_MARGIN) * current
	return round(UI_Y_MIDDLE - menu_height + offset) 
}

function calculate_element_width(text) {
	return (MENU_ELEMENT_PADDING * 2) + string_width(text)
}

function draw_page() {
	// get current page
	var page = pages[selected_page]
	// create instances for each element
	for (var i = 0; i < array_length(page); i++) {
		var element = page[i]
		array_push(
			instances,
			instance_create_layer(
				MENU_X1, calculate_element_y1(array_length(page), i),
				"menu", obj_menu_element,
				{
					WIDTH: calculate_element_width(element[0]), 
					HEIGHT: MENU_ELEMENT_HEIGHT,
					SELECTED: (selected_sub_page == undefined) ? (false) : ((selected_sub_page + 1) == i),
					TEXT: element[0], 
					ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
				}
			)
		)
	}
}

function draw_sub_page() {	
	// get current sub page
	var sub_page = sub_pages[selected_sub_page]
	// get the width of the longest element
	var element_width = 0
	for (var i = 0; i < array_length(sub_page); i++) {
		element_width = max(element_width, calculate_element_width(sub_page[i][0]))
	}
	// create instances for each element
	for (var i = 0; i < array_length(sub_page); i++) {
		var element = sub_page[i]
		array_push(
			instances, 
			instance_create_layer(
				(UI_X_MIDDLE / 2), calculate_element_y1(array_length(sub_page), i),
				"menu", obj_menu_element,
				{
					WIDTH: element_width, 
					HEIGHT: MENU_ELEMENT_HEIGHT,
					SELECTED: false,
					TEXT: element[0],
					ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
				}
			)
		)
	}
}