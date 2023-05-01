// set font/alignment
draw_set_font(fnt_menu)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)

// draw button/text
draw_sprite_stretched_ext(
	spr_gui_background, 0,
	X1, Y1, WIDTH, HEIGHT,
	colour, 1
)
draw_text_colour(
	X1 + MENU_PADDING, 
	Y1 + (HEIGHT / 2) + 2, 
	TEXT,
	c_black, c_black, c_black, c_black,
	1
)

// draw element-specific actions
switch (ACTION) {
	case MenuElementAction.slide_value:
		draw_sprite_stretched_ext(
			spr_gui_background, 0,
			X2 + MENU_MARGIN, Y1, 
			150, HEIGHT,
			colour, 1
		)
		draw_roundrect_colour_ext(
			X2 + MENU_MARGIN + (150 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + MENU_MARGIN + (150 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #767171, #767171, false
		)
		draw_roundrect_colour_ext(
			X2 + MENU_MARGIN + (150 * 0.05), Y1 + (HEIGHT / 2) - 5,
			X2 + MENU_MARGIN + (150 * 0.95), Y1 + (HEIGHT / 2) + 5,
			2.5, 2.5, #3b3838, #3b3838, true
		)
		break
	case MenuElementAction.shift_value:
		draw_sprite_stretched_ext(
			spr_gui_background, 0,
			X2 + MENU_MARGIN, Y1, 
			150, HEIGHT,
			colour, 1
		)
		break
}
