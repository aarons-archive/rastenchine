function Gun() : Weapon() constructor {

	sprite = spr_gun
	damage = GUN_DAMAGE
	
	bullets = GUN_MAX_BULLETS
	reloading = false
	
	static alarm_one = function() {
		reloading = false
		bullets = GUN_MAX_BULLETS
	}

	static attack = function() {
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