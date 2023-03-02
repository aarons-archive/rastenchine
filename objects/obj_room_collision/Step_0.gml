active = ((instance_place(x, y, obj_player) != noone) or (activated_by != noone)) 

if ((light == undefined) && (active == true)) {
	light = light_create_point(x, y, 64000, $FFFFFFFF, 500, 0)
	light_add_to_world(light)
}
if (light != undefined) {
	if (active == false) {
		if (light[| eLight.Intensity] > 0.2) {
			light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 0, 0.1)
		}
		else {
			light_remove_from_world(light)
			light = light_destroy(light)
		}
	}
	else if (light[| eLight.Intensity] < 4.9) {
		light[| eLight.Intensity] = lerp(light[| eLight.Intensity], 5, 0.05)
	}
}

var list = ds_list_create()
var rooms = collision_rectangle_list(
	bbox_left - 1, bbox_top - 1,
	bbox_right + 1, bbox_bottom + 1,  
	obj_room_collision, true, false,
	list, false
)
if (rooms > 0) {
	for (var i = 0; i < rooms; ++i;) {
		list[| i].activated_by = self
		
	}
}
ds_list_destroy(list)