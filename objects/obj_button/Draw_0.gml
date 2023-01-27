draw_set_font(fnt_menu)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_rectangle_colour(
	x1, y1, 
	x2, y2, 
	_button_colour, _button_colour, _button_colour, _button_colour, 
	false
)
draw_text_colour(
	x + (length / 2), y + (height / 2), 
	text,
	text_colour, text_colour, text_colour, text_colour,
	1
)