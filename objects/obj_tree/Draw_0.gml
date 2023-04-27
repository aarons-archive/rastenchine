if (obj_player.y < tree_y) 
{
	show_debug_message("IN FRONT")
	depth = 300
}
else 
{	
	show_debug_message("BEHIND")
	depth = 600
}
draw_self()