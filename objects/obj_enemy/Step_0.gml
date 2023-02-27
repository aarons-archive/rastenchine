#region death
if (_health < 1) {
	_speed = 0
	//sprite_index = death_sprite
	//if (image_index == 8) {
		instance_destroy()
	//}
}
#endregion