function create_page(elements) {
	var width = 0
	for (var i = 0; i < array_length(elements); i++) {
		width = max(width, array_length(elements[i]))
	}
	var height = array_length(elements)
	var grid = ds_grid_create(width, height)
	for (var i = 0; i < height; i++) {
		for (var j = 0; j < width; j++) {
			grid[# j, i] = elements[i, j] 
		}
	}
	return grid
}

function render_menu() {
	
	// Common
	var MENU_START_X = 20
	var PAGE_START_Y = 20
	var SUB_PAGE_START_Y = 120
	var ELEMENT_TEXT_SCALE = 30
	var ELEMENT_HEIGHT = 60
	var ELEMENT_OFFSET = 5
	
	#region Pages
	var elements = pages[page]
	var height = ds_grid_height(elements)
	var page_x = MENU_START_X
	
	for (var element_index = 0; element_index < height; element_index++) {
		var text = elements[# 0, element_index]
		var element_length = string_length(text) * ELEMENT_TEXT_SCALE 
		ds_list_add(
			buttons, 
			instance_create_layer(
				page_x, 
				PAGE_START_Y,
				"Instances",
				obj_button,
				{
					LENGTH: element_length,
					HEIGHT: ELEMENT_HEIGHT,
					TEXT: text,
					SELECTED: (sub_page == undefined ? false : ((sub_page + 1) == element_index)),
					ACTION: elements[# 1, element_index],
					FUNCTION: elements[# 2, element_index],
					ARG_0: elements[# 3, element_index],
					ARG_1: elements[# 4, element_index]
				}
			)
		)
		page_x = page_x + element_length + ELEMENT_OFFSET
	}
	#endregion

	// Sub Pages
	if (sub_page != undefined) {
		elements = sub_pages[sub_page]
		height = ds_grid_height(elements)
		for (var element_index = 0; element_index < height; element_index++) {
			var text = elements[# 0, element_index]
			var element_length = string_length(text) * ELEMENT_TEXT_SCALE 
			ds_list_add(
				buttons, 
				instance_create_layer(
					MENU_START_X, 
					SUB_PAGE_START_Y + ((ELEMENT_HEIGHT + ELEMENT_OFFSET) * element_index),
					"Instances",
					obj_button,
					{
						LENGTH: element_length,
						HEIGHT: ELEMENT_HEIGHT,
						TEXT: text,
						SELECTED: false,
						ACTION: elements[# 1, element_index],
						FUNCTION: elements[# 2, element_index],
						ARG_0: elements[# 3, element_index],
						ARG_1: elements[# 4, element_index]
					}
				)
			)
		}
	}
}

function change_page(_page, _subpage) {
	with (obj_menu) {
		for (var i = 0; i < ds_list_size(buttons); i++) {
			instance_destroy(buttons[| i])
		}
		page = _page
		sub_page = _subpage
		render_menu()
	}
}
