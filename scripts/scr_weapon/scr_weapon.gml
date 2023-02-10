enum weapon_state {
	idle,
	charging,
	attacking,
	cooldown
}

function Weapon() : Item() constructor {
	
	instance = undefined
	sprite = undefined
	
	state = weapon_state.idle
	
	center_y_offset = -8
	center_y = obj_player.y + center_y_offset
	aim_dir = 0
	weap_dis = 50
	
	static draw = function() {
		center_y = obj_player.y + center_y_offset
		aim_dir = point_direction(obj_player.x, center_y, mouse_x, mouse_y)
		instance.depth = obj_player + (aim_dir > 90 && aim_dir < 270)
		if (!mouse_check_button_pressed(mb_left)) {
			instance.image_angle = aim_dir
		}
		instance.x = obj_player.x + lengthdir_x(weap_dis, aim_dir)
		instance.y = obj_player.y + lengthdir_y(weap_dis, aim_dir)
		weap_dis = lerp(weap_dis, 30, 0.1)
		instance.image_yscale = (aim_dir > 90 and aim_dir < 270) ? -1 : 1
	}
}