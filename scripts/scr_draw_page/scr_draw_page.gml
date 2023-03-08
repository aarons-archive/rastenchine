function draw_page() {
	
	draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	
	var page = pages[selected_page]
	var page_x = MENU_X
	for (var i = 0; i < array_length(page); i++) {
		var element = page[i]
		var text = element[0]
		var element_width = string_width(text) + ELEMENT_PADDING
		array_push(
			instances, 
			instance_create_layer(
				page_x, 
				MENU_PAGE_Y,
				"Instances",
				obj_element,
				{
					WIDTH: element_width,
					HEIGHT: ELEMENT_HEIGHT,
					TEXT: text,
					SELECTED: (selected_sub_page == undefined ? false : (selected_sub_page + 1) == i),
					ACTION: element[1],
					FUNCTION: element[2],
					ARG_0: element[3],
					ARG_1: element[4]
				}
			)
		)
		page_x += element_width + ELEMENT_MARGIN
	}

	if (selected_sub_page != undefined) {
		var sub_page = sub_pages[selected_sub_page]
		var element_width = array_max(array_map(sub_page, function(element) {return string_width(element[@ 0]) + ELEMENT_PADDING}))
		for (var i = 0; i < array_length(sub_page); i++) {
			var element = sub_page[i]
			var text = element[0]
			array_push(
				instances, 
				instance_create_layer(
					MENU_X, 
					MENU_SUB_PAGE_Y + ((ELEMENT_HEIGHT + ELEMENT_MARGIN) * i),
					"Instances", 
					obj_element,
					{
						WIDTH: element_width,
						HEIGHT: ELEMENT_HEIGHT,
						TEXT: text,
						SELECTED: false,
						ACTION: element[1],
						FUNCTION: element[2],
						ARG_0: element[3],
						ARG_1: element[4]
					}
				)
			)
		}
	}
}
