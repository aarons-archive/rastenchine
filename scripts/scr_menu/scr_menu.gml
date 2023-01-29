function render_page() {
	
	draw_set_valign(fa_middle)
	draw_set_halign(fa_left)
	draw_set_font(fnt_menu)
	
	var MENU_START_X = 20
	var PAGE_START_Y = 20
	var SUB_PAGE_START_Y = 100
	
	var ELEMENT_PADDING = 20
	var ELEMENT_MARGIN = 5
	
	#region Pages
	var page = pages[selected_page]
	var page_x = MENU_START_X
	
	for (var i = 0; i < array_length(page); i += 1) {
		var element = page[@ i]
		var text = element[@ 0]
		var element_width = string_width(text) + ELEMENT_PADDING
		array_push(
			instances, 
			instance_create_layer(
				page_x, 
				PAGE_START_Y,
				"Instances",
				obj_element,
				{
					WIDTH: element_width,
					HEIGHT: string_height(text) + ELEMENT_PADDING,
					TEXT: text,
					SELECTED: (selected_sub_page == undefined ? false : (selected_sub_page + 1) == i),
					ACTION: element[@ 1],
					FUNCTION: element[@ 2],
					ARG_0: element[@ 3],
					ARG_1: element[@ 4]
				}
			)
		)
		page_x += element_width + ELEMENT_MARGIN
	}
	#endregion

	// Sub Pages
	if (selected_sub_page != undefined) {
		page = sub_pages[selected_sub_page]
		for (var i = 0; i < array_length(page); i++) {
			var element = page[@ i]
			var text = element[@ 0]
			var element_height = string_height(text) + ELEMENT_PADDING
			array_push(
				instances, 
				instance_create_layer(
					MENU_START_X, 
					SUB_PAGE_START_Y + ((element_height + ELEMENT_MARGIN) * i),
					"Instances", 
					obj_element,
					{
						WIDTH: string_width(text) + ELEMENT_PADDING,
						HEIGHT: element_height,
						TEXT: text,
						SELECTED: false,
						ACTION: element[@ 1],
						FUNCTION: element[@ 2],
						ARG_0: element[@ 3],
						ARG_1: element[@ 4]
					}
				)
			)
		}
	}
}

function change_page(page, sub_page) {
	with (obj_menu) {
		selected_page = page
		selected_sub_page = sub_page
		array_map_ext(instances, function(element) {instance_destroy(element)})
		array_resize(instances, 0)
		render_page()
	}
}
