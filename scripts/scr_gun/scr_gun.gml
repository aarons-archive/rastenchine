function Gun() : Weapon() constructor {

	sprite = spr_gun
	damage = GUN_DAMAGE
	
	bullets = GUN_MAX_BULLETS
	reloading = false
	
	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_gun
		bullets = GUN_MAX_BULLETS
	}
	
	static attack = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button_pressed(global.ATTACK_BUTTON)) && (bullets >= 1)) {
					var _direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
					instance_create_layer(instance.x, instance.y, "instances", obj_projectile, { sprite_index: spr_bullet, speed: 8, direction: _direction, image_angle: _direction })
					bullets -= 1
				}
				else if ((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((bullets <= 0) && (mouse_check_button_pressed(global.ATTACK_BUTTON)))) {
					state = weapon_state.reloading
					instance.sprite_index = spr_gun_reloading
				}
				break
			case weapon_state.reloading:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = GUN_RELOAD_FRAMES
				} 
				break
			case weapon_state.cooldown:
				state = weapon_state.idle
				break
		}
	}
}