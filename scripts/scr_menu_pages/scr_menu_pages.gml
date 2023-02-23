function menu_create_page() {
	_draw_page()
	if (selected_sub_page != undefined) { _draw_sub_page() }
}

function menu_change_page(page, sub_page) {
	with (obj_menu) {
		selected_page = page
		selected_sub_page = sub_page
		array_map_ext(instances, function(element) { instance_destroy(element) })
		array_resize(instances, 0)
		menu_create_page()
	}
}

function _draw_page() {
	draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	
	var page = pages[selected_page]
	var page_x = MENU_X
	
	for (var i = 0; i < array_length(page); i++) {
		var element = page[i]
		var element_width = string_width(element[0]) + MENU_ELEMENT_PADDING
		array_push(
			obj_menu.instances,
			instance_create_layer(
				page_x, 
				MENU_PAGE_Y,
				"Instances", 
				obj_menu_element,
				{
					WIDTH: element_width, 
					HEIGHT: MENU_ELEMENT_HEIGHT,
					TEXT: element[0], 
					SELECTED: (selected_sub_page == undefined ? false : (selected_sub_page + 1) == i),
					ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
				}
			)
		)
		page_x += element_width + MENU_ELEMENT_MARGIN
	}
}

function _draw_sub_page() {	
	draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	
	var sub_page = sub_pages[selected_sub_page]
	var element_width = array_max(array_map(sub_page, function(element) { return string_width(element[0]) + MENU_ELEMENT_PADDING }))
		
	for (var i = 0; i < array_length(sub_page); i++) {
		var element = sub_page[i]
		array_push(
			obj_menu.instances, 
			instance_create_layer(
				MENU_X, 
				MENU_SUB_PAGE_Y + ((MENU_ELEMENT_HEIGHT + MENU_ELEMENT_MARGIN) * i),
				"Instances", 
				obj_menu_element,
				{
					WIDTH: element_width, 
					HEIGHT: MENU_ELEMENT_HEIGHT,
					TEXT: element[0],
					SELECTED: false,
					ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
				}
			)
		)
	}
}