do_run()
do_roll()
do_movement(
	(keyboard_check(global.RIGHT_KEY) - keyboard_check(global.LEFT_KEY)), 
	(keyboard_check(global.DOWN_KEY) - keyboard_check(global.UP_KEY))
)

_inventory.step()

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

room_col = instance_place(x, y, obj_room_collision)
if (room_col != noone && room_light == undefined)
{
	room_light = light_create_point(room_col.x, room_col.y, 64000, $FFFFFFFF, 0, 4);
	light_add_to_world(room_light)
}
else if (room_col == noone && room_light != undefined)
{
	if (room_light[| eLight.Range] > 180) {
		room_light[| eLight.Range] = lerp(room_light[| eLight.Range], 0, 0.3)
	}
	else {
		light_remove_from_world(room_light)
		light_destroy(room_light)
		room_light = undefined
	}
}
if (room_light != undefined) {
	room_light[| eLight.Range] = lerp(room_light[| eLight.Range], 500, 0.1)
}