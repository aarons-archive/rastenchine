var player = instance_place(x, y, obj_player)

if ((light == undefined) && (player != noone)) {
	light = light_create_point(x, y, 64000, $FFFFFFFF, 10, 3)
	light_add_to_world(light)
}

if (light != undefined) {
	if (player == noone) {
		if (light[| eLight.Range] > 5) {
			light[| eLight.Range] = lerp(light[| eLight.Range], 0, 0.4)
		}
		else {
			light_remove_from_world(light)
			light = light_destroy(light)
		}
	}
	else if (light[| eLight.Range] < 500) {
		light[| eLight.Range] = lerp(light[| eLight.Range], 505, 0.2)
	}
}