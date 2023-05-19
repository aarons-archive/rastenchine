if (global.win)
{
	room_goto(rm_win)	
}

if (room = rm_death) && (keyboard_check(vk_space)) game_restart()
