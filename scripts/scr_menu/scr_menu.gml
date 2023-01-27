function play_game() {
	room_goto(rm_tutorial)
}

function exit_game() {
	game_end()
}

function create_menu(elements) {
	var width = 0;
	for (var i = 0; i < array_length(elements); i++) {
		width = max(width, array_length(elements[i]))
	}
	var height = array_length(elements)
	var ds_grid = ds_grid_create(width, height)
	for (var _x = 0; _x < height; _x++) {
		for (var _y = 0; _y < width; _y++) {
			ds_grid[# _y, _x] = elements[_x, _y] 
		}
	}
	return ds_grid
}

function draw_menu() {
	var menu = pages[page]
	var height = ds_grid_height(menu)

	var MENU_X = 20
	var MENU_Y = 20
	var ELEMENT_TEXT_SCALE = 30
	var ELEMENT_HEIGHT = 60
	var ELEMENT_X_OFFSET = 5

	var menu_x = MENU_X

	for (var i = 0; i < height; i++) {
		var text = menu[# 0, i]
		var element_length = string_length(text) * ELEMENT_TEXT_SCALE 
		ds_list_add(
			buttons, 
			instance_create_layer(
				menu_x,
				MENU_Y,
				"Instances",
				obj_button,
				{
					length: element_length,
					height: ELEMENT_HEIGHT,
					text: text,
					element: menu[# 1, i],
					func: menu[# 2, i],
					arg0: menu[# 3, i],
					arg1: menu[# 4, i]
				}
			)
		)
	
		menu_x = menu_x + element_length + ELEMENT_X_OFFSET 
	}
	
	if (subpage != undefined) {
		var menu = subpages[subpage]
		var height = ds_grid_height(menu)

		var MENU_X = 20
		var MENU_Y = 120
		var ELEMENT_TEXT_SCALE = 30
		var ELEMENT_HEIGHT = 60
		var ELEMENT_X_OFFSET = 5

		var menu_x = MENU_X

		for (var i = 0; i < height; i++) {
			var text = menu[# 0, i]
			var element_length = string_length(text) * ELEMENT_TEXT_SCALE 
			ds_list_add(
				buttons, 
				instance_create_layer(
					menu_x,
					MENU_Y,
					"Instances",
					obj_button,
					{
						length: element_length,
						height: ELEMENT_HEIGHT,
						text: text,
						element: menu[# 1, i],
						func: menu[# 2, i],
						arg0: menu[# 3, i],
						arg1: menu[# 4, i]
					}
				)
			)
	
			menu_x = menu_x + element_length + ELEMENT_X_OFFSET 
		}
	}
}

function change_page(_page, _subpage) {
	with (obj_menu) {
		for (var i = 0; i < ds_list_size(buttons); i++) {
			instance_destroy(buttons[| i])
		}
		page = _page
		subpage = _subpage
		draw_menu()
	}
}
