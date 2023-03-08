draw_set_font(fnt_menu)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)

draw_rectangle_colour(
	X1, Y1, X2, Y2, 
	_colour, _colour, _colour, _colour, 
	false
)
draw_text_colour(
	X1 + (ELEMENT_PADDING / 2), 
	Y1 + (HEIGHT / 2) + UI_TUNING, 
	TEXT,
	UI_FG_COLOR, UI_FG_COLOR, UI_FG_COLOR, UI_FG_COLOR,
	1
)

switch (ACTION) {
	case menu_element_action.slide_value:
		draw_rectangle_colour(
			X2 + ELEMENT_MARGIN, Y1,
			X2 + 200 + ELEMENT_MARGIN, Y2,
			_colour, _colour, _colour, _colour,
			false
		)
		draw_roundrect_colour_ext(
			X2 + ELEMENT_MARGIN + (200 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + ELEMENT_MARGIN + (200 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #767171, #767171, false
		)
		draw_roundrect_colour_ext(
			X2 + ELEMENT_MARGIN + (200 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + ELEMENT_MARGIN + (200 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #3b3838, #3b3838, true
		)
		break
	case menu_element_action.shift_value:
		draw_rectangle_colour(
			X2 + ELEMENT_MARGIN, Y1,
			X2 + 200 + ELEMENT_MARGIN, Y2,
			_colour, _colour, _colour, _colour,
			false
		)
		break
}
