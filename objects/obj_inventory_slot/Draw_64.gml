draw_sprite_stretched_ext(
	GUI_BG_SPRITE, 0,
	x, y, width, height,
	colour, 1
)
if (sprite != undefined) {
	draw_sprite(
		sprite, 0,
		x + (INVENTORY_SLOT_WIDTH / 2),
		y + (INVENTORY_SLOT_HEIGHT / 2)
	)
}

if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), x, y, x2, y2) == true) {
	colour = c_green
}
else {
	colour = c_white
}