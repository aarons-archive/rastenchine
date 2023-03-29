if (showNote)
{

	//Draw The Box
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_roundrect_ext(guix-w,guiy,guix+w,guiy+h+border,15,15,false); 
	draw_set_alpha(1);

	//Draw Text
	draw_set_colour(c_white);
	draw_set_font(fnt_note);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(guix,guiy+border,text_current);
}