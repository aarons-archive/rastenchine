draw_self();

draw_circle_color(x,y,_attack_radius,c_green,c_red,1)
draw_circle_color(x,y,_vision_radius,c_green,c_blue,1)
draw_circle_color(x,y,_agro_radius,c_green,c_green,1)

draw_healthbar(x,y - 16,x + 64,y - 5, _hp, c_black,c_red,c_red,0,false,false)

if keyboard_check(ord("P"))
{
	draw_path(path,x,y,0)	
}