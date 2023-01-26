draw_self();

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