
active = ((place_meeting(x, y, obj_player) == true) or (activated_by != undefined))

if ((activated_by != undefined) and (activated_by.active == false)) {
	active = false
	activated_by = undefined
}

if (active == true) {
	if (light == undefined) {
		light = light_create_point(x, y, 64000, $FFFFFFFF, 500, 0)
		light_add_to_world(light)
	}
	else if (light[| eLight.Intensity] < 5.0) {
		light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 5.0, 0.1)
	}
	if (connected_room_count >= 1) {
		for (var i = 0; i < connected_room_count; ++i;) {
			if (connected_rooms[| i].id == activated_by) { continue }
			connected_rooms[| i].activated_by = (activated_by != undefined) ? activated_by : self.id
		}
	}
}
else if ((active == false) and (light != undefined)) {
	if (light[| eLight.Intensity] > 0.1) {
		light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 0.0, 0.1)
	}
	else {
		light_remove_from_world(light)
		light = light_destroy(light)
	}
}
