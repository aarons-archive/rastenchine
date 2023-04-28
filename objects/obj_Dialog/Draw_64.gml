draw_set(c_black, 0.7);

draw_rectangle(0, display_get_gui_height(), display_get_gui_width(), position_bar_y, false)

draw_reset();

if(can_display_text)
{
	draw_set_align(fa_center, fa_middle);	
	draw_set_font(fnt_menu);
	draw_sprite(dialog_get_picture(), 0, 32, position_bar_y-156);
	var message = dialog_get_text();
	var text = string_copy(message, 0, character_index);
	draw_text(display_get_gui_width() / 2, display_get_gui_height() - 60, text);
	
	if (is_waiting_for_keypress)
	{
		draw_set_align(fa_left, fa_middle);
		text = "Press any key...";
		var text_length = string_width(text);
		draw_text_transformed(display_get_gui_width() - text_length, display_get_gui_height() - 20, text, 0.75, 0.75, 0);
	}
}
