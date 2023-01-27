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
	
	instance_create_layer(
		menu_x,
		MENU_Y,
		"Instances",
		obj_button,
		{
			length: element_length,
			height: ELEMENT_HEIGHT,
			text: text
		}
	)
	
	menu_x = menu_x + element_length + ELEMENT_X_OFFSET 
}