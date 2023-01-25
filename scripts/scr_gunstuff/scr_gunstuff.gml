function draw_my_weapon()
{
	
	//get the weapon off the players body
	var _xOffset = lengthdir_x(weaponOffsetDist, _aim_dir);
	var _yOffset = lengthdir_y(weaponOffsetDist, _aim_dir);

	//flip weapon upright
	var _weaponYscl = 1;
	if _aim_dir > 90 && _aim_dir < 270
	{
		_weaponYscl = -1;	
	}

	draw_sprite_ext(weaponSprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, _aim_dir, c_white, 1);	
}