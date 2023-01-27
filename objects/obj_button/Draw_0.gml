draw_set_font(fnt_menu)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var button_colour = #A6A6A6
var text_colour = #000000

draw_rectangle_colour(
	x, y, 
	x + length, y + height, 
	button_colour, button_colour, button_colour, button_colour, 
	false
)
draw_text_colour(
	x + (length / 2), y + (height / 2), 
	text,
	text_colour, text_colour, text_colour, text_colour,
	1
)