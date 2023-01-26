draw_text_color(100,200,_speed,c_green,c_green,c_green,c_green,1)
draw_text_color(50,200,_healing_pack,c_blue,c_blue,c_blue,c_blue,1)
draw_healthbar(50,110,150,160,_stamina,c_black,c_red,c_yellow,0,true,true)
draw_healthbar(50,50,150,100,_health,c_black,c_red,c_red,0,true,true)
draw_healthbar(obj_player.x - 15,obj_player.y + 20 ,obj_player.x + 15,obj_player.y+ 25,_heal_counter,c_black,c_white,c_red,0,false,false)

if _stamina_lock == true //stamina gone notifier
{
	draw_text_color(50,170,"EXAHUSTED!",c_green,c_green,c_green,c_green,1)
}
