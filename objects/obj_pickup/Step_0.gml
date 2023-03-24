image_xscale = scale
image_yscale = scale * sign(image_yscale)

var mouse_is_near_item = point_in_rectangle(
	obj_crosshair.x, obj_crosshair.y,
	bbox_left - 10, bbox_top - 10,
	bbox_right + 10, bbox_bottom + 10
)
var player_is_near_item = point_in_circle(
	obj_player.x, obj_player.y, 
	x, y, 75
)
var player_is_holding_grab_key = keyboard_check(global.SELECT_KEY)

if (mouse_is_near_item and player_is_near_item) {
	scale = lerp(scale, 1.25, 0.25)
	if (player_is_holding_grab_key) {
		instance_destroy(self)
		obj_player.inventory.add_item(struct)
	}
}
else {
	scale = lerp(scale, 1, 0.25)
}
