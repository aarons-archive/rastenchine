if (room != rm_finley_containment_zone) && (room != rm_death) && (room != rm_win) {
	room_goto(rm_finley_containment_zone)
	x = 135
	y = 3983
} 

depth = -(y / 10)

_x = x
_y = y - PLAYER_ORIGIN_OFFSET
_direction = point_direction(_x, _y, mouse_x, mouse_y)
audio_listener_position(_x,_y,0)

get_inputs()
handle_movement_state()
do_movement()
do_animation()

inventory.step()

if (global.fell) && (scale > 0) {
	movement_state = player_movement_state.dodging
	x++;
	scale-=0.01;
	image_xscale = scale;
	image_yscale = scale;
	if (inventory.item != undefined) {
		inventory.item.instance.image_xscale = scale
		inventory.item.instance.image_yscale = scale
	}
}
else if (global.fell) && (scale <= 0.01) && (room != rm_fell_and_died) {
	room_goto(rm_fell_and_died)	
}

if (_health <= 0) && (room != rm_death)
{
	room_goto(rm_death)	
}