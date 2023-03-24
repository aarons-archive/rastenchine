if (selected && obj_player.select_input) showNote = true;
if (showNote)
{
	//remove player control	
	if !instance_exists(obj_follow) camFollow = instance_create_layer(x,y+200,"other",obj_follow);
	obj_camera.follow = camFollow;
	letters += spd;
	text_current = string_copy(text,1,floor(letters));

	//draw_set_font(fSmolText);
	if (h == 0) h = string_height(text);
	if (w ==0) w = string_width(text)/2;
}
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	showNote = false;
	letters = 0;
	with (obj_camera) follow = obj_player;
	//give player control
	instance_destroy(camFollow);
}
else if (letters > 10) && (keyboard_check_pressed(vk_anykey))
{
	letters = length;	
}
