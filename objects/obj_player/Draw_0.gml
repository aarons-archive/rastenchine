draw_self();
draw_text_color(100,200,_speed,c_green,c_green,c_green,c_green,1)
draw_healthbar(100,100,200,150,_stamina,c_black,c_red,c_yellow,0,true,true)

if _stamina_lock == true //stamina gone notifier
{
	draw_text_color(100,150,"EXAHUSTED!",c_green,c_green,c_green,c_green,1)
}

#region flip weapon
//draw weapon above
if _aim_dir >= 0 && _aim_dir < 180
{
	draw_my_weapon()
}

//draw weapon below
if _aim_dir >= 180 && _aim_dir < 360
{
	draw_my_weapon()
}
#endregion

#region flip player
if _x_movement > 1
{
	image_angle = 0
	image_yscale = 1;
}
if _x_movement < 0
{
	image_angle = 180
	image_yscale = -1;
}
#endregion