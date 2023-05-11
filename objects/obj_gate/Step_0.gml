var player_is_near_gate = point_in_circle(obj_player._x, obj_player._y, x, y, 100)
var player_is_pressing_open_gate_key = keyboard_check_pressed(global.OPEN_GATE_KEY)

if (player_is_near_gate and player_is_pressing_open_gate_key) {
	if (
		array_find_index(
			obj_player.inventory.inventory,	
			function(_element) {
				if (_element == undefined) { return false}
				else { return string_replace(sprite_get_name(_element.DEFAULT_SPRITE), "spr_key", "spr_gate") == sprite_get_name(sprite_index) }
			}
		) != -1
	) {
		open = !open
		show_debug_message(open)
		image_index = (open ? sprite_get_number(sprite_index) - 1 : 0)
	}
}