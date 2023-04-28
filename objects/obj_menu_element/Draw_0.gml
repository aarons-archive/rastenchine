// set font/alignment
draw_set_font(fnt_menu)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)

// draw button/text
draw_sprite_stretched_ext(
	spr_ui_background, 0,
	X1, Y1, WIDTH, HEIGHT,
	colour, 1
)
draw_text_colour(
	X1 + MENU_ELEMENT_PADDING, 
	Y1 + (HEIGHT / 2) + 2, 
	TEXT,
	UI_FG_COLOR, UI_FG_COLOR, UI_FG_COLOR, UI_FG_COLOR,
	1
)

// draw element-specific actions
switch (ACTION) {
	case menu_element_action.slide_value:
		draw_sprite_stretched_ext(
			spr_ui_background, 0,
			X2 + MENU_ELEMENT_MARGIN, Y1, 
			150, HEIGHT,
			colour, 1
		)
		draw_roundrect_colour_ext(
			X2 + MENU_ELEMENT_MARGIN + (150 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + MENU_ELEMENT_MARGIN + (150 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #767171, #767171, false
		)
		draw_roundrect_colour_ext(
			X2 + MENU_ELEMENT_MARGIN + (150 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + MENU_ELEMENT_MARGIN + (150 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #3b3838, #3b3838, true
		)
		break
	case menu_element_action.shift_value:
		draw_sprite_stretched_ext(
			spr_ui_background, 0,
			X2 + MENU_ELEMENT_MARGIN, Y1, 
			150, HEIGHT,
			colour, 1
		)
		break
}
