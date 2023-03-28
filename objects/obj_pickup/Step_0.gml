image_xscale = scale
image_yscale = scale * sign(image_yscale)

var mouse_is_near_item = collision_point(obj_crosshair.x, obj_crosshair.y, self, true, false)
var player_is_near_item = point_in_circle(obj_player.x, obj_player.y, x, y, 100)
var player_is_holding_grab_key = keyboard_check_pressed(global.SELECT_KEY)

if ((mouse_is_near_item != noone) and (player_is_near_item == true)) {
	scale = lerp(scale, 1.1, 0.25)
	if (player_is_holding_grab_key == true) {
		instance_destroy(self)
		obj_player.inventory.add_item(struct)
	}
}
else {
	scale = lerp(scale, 1, 0.25)
}
