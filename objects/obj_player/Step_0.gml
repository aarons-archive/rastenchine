do_run()
do_roll()
do_movement(
	(keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)), 
	(keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY))
)


if (_x_movement > 1) {
	image_angle = 0
	image_yscale = 1
}
if (_x_movement < 0) {
	image_angle = 180
	image_yscale = -1
}

#region Healing
if _health > MAX_HEALTH {_health = MAX_HEALTH}

if keyboard_check_pressed(ord("K")){_health -= 10}

if keyboard_check(ord("H")) && _healing_pack > 0 && _heal_cooldown == false
{
	_heal_counter += 1;
} else {_heal_counter = 0 }
if _heal_counter >= 100
{
	_heal_cooldown = true;
	alarm[4] = 120;
	_healing_pack -= 1
	_health += 50
	_heal_counter = 0
}
#endregion

#region Lighting
flash_light[| eLight.X] = x
flash_light[| eLight.Y] = y
flash_light[| eLight.Direction] = point_direction(x, y, mouse_x, mouse_y)
flash_light[| eLight.Flags] |= eLightFlags.Dirty
		
point_light[| eLight.X] = x
point_light[| eLight.Y] = y
point_light[| eLight.Flags] |= eLightFlags.Dirty
#endregion

if (place_meeting(x,y,obj_room_collision) && room_light == undefined)
{
	room_light = light_create_point(other.x, other.y, 64000, $FFFFFFFF, 250, 2)	
}
else {
	room_light = undefined
}