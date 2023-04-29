function element_y1(element_count, index, height) {
	var page_height = (height * element_count) + (MENU_MARGIN * (element_count - 1))
	var element_offset = ((height + MENU_MARGIN) * index)
	return round((MENU_MIDDLE_Y - (page_height / 2)) + element_offset) 
}

function element_width(text) { return (MENU_PADDING * 2) + string_width(text) }
function element_height(text) { return (MENU_PADDING * 2) + string_height(text) }

function longest_element_width(page) {
	var width = 0
	for (var i = 0; i < array_length(page); i++) { 
		width = max(width, element_width(page[i][0])) 
	}
	return width
}

function menu_render_page() {
	/////////////////////////////////
	// set text font and alignment //
	/////////////////////////////////
	draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	//////////
	// page //
	//////////
	var page = pages[selected_page]
	for (var i = 0; i < array_length(page); i++) {
		var element = page[i]
		var height = element_height(element[0])
		array_push(instances, instance_create_layer(
			MENU_X1, element_y1(array_length(page), i, height),
			"managers", obj_menu_element,
			{
				WIDTH: element_width(element[0]), HEIGHT: height,
				SELECTED: (selected_sub_page == undefined) ? (false) : ((selected_sub_page + 1) == i),
				TEXT: element[0], 
				ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
			}
		))
	}
	//////////////
	// sub page //
	//////////////
	if (selected_sub_page != undefined) {
		var sub_page = sub_pages[selected_sub_page]
		var width = longest_element_width(sub_page)
		for (var i = 0; i < array_length(sub_page); i++) {
			var element = sub_page[i]
			array_push(instances, instance_create_layer(
				MENU_MIDDLE_X * 0.65, element_y1(array_length(sub_page), i, element_height(element[0])),
				"managers", obj_menu_element,
				{
					WIDTH: width, HEIGHT: element_height(element[0]),
					SELECTED: false,
					TEXT: element[0],
					ACTION: element[1], FUNCTION: element[2], ARG_0: element[3], ARG_1: element[4]
				}
			))
		}
	}
}

