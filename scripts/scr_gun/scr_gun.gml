function Gun() : Weapon() constructor {

	sprite = spr_gun
	damage = GUN_DAMAGE
	
	bullets = GUN_MAX_BULLETS
	reloading = false
	
	static alarm_one = function() {
		state = weapon_state.idle
	}
	
	static alarm_two = function() {
		
	}

	static attack = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button_pressed(global.ATTACK_BUTTON)) && (bullets >= 1)) {
					var _direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
					instance_create_layer(instance.x, instance.y, "instances", obj_projectile, { sprite_index: spr_bullet, speed: 8, direction: _direction, image_angle: _direction })
					bullets -= 1
				}
				else if ((mouse_check_button_pressed(global.RELOAD_GUN_KEY))) {
					state = weapon_state.reloading
				}
				break
			case weapon_state.cooldown:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = 0
				} 
		}
		
		
		if (keyboard_check_pressed(global.RELOAD_GUN_KEY)) {
			reloading = true
			instance.alarm[1] = GUN_RELOAD_FRAMES
		}
		if ((mouse_check_button_pressed(global.ATTACK_BUTTON) == true) && (bullets >= 1) && (reloading == false)) {
			bullets -= 1
			var _direction = point_direction(obj_item.x, obj_item.y, mouse_x, mouse_y)
			instance_create_layer(obj_item.x, obj_item.y, "instances", obj_projectile, { sprite_index: spr_bullet, speed: 6, direction: _direction, image_angle: _direction })
		}
	}
}

// TODO: use state machine here xd