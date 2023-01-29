draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(fnt_menu)

draw_rectangle_colour(
	X1, Y1, X2, Y2, 
	_button_colour, _button_colour, _button_colour, _button_colour, 
	false
)
draw_text_colour(
	x + (WIDTH / 2), y + (HEIGHT / 2), 
	TEXT,
	TEXT_COLOUR, TEXT_COLOUR, TEXT_COLOUR, TEXT_COLOUR,
	1
)
