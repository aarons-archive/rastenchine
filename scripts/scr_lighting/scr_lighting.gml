function lighting() {
	#region Room light
	var _room = instance_place(x, y, obj_room_collision)
	if ((room_light == undefined) && (_room != noone)) {
		room_light = light_create_point(_room.x, _room.y, 64000, $FFFFFFFF, 10, 3)
		light_add_to_world(room_light)
	}
	if (room_light != undefined) {
		if (_room == noone) {
			if (room_light[| eLight.Range] > 5) {
				room_light[| eLight.Range] = lerp(room_light[| eLight.Range], 0, 0.2)
			}
			else {
				light_remove_from_world(room_light)
				room_light = light_destroy(room_light)
			}
		}
		else if (room_light[| eLight.Range] < 500) {
			room_light[| eLight.Range] = lerp(room_light[| eLight.Range], 505, 0.2)
		}
	}
	#endregion
}
