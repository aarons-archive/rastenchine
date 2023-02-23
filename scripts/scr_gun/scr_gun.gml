function Gun() : Weapon() constructor {

	sprite = spr_gun
	damage = GUN_DAMAGE
	
	ammo = GUN_MAX_AMMO
	clip = GUN_CLIP
	reloading = false
	
	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_gun
		if (clip + ammo) < GUN_CLIP
		{
			clip = ammo
			ammo = 0;
		}
		else
		{
		ammo -= (GUN_CLIP - clip);
		clip = GUN_CLIP;
		}
	}
	
	static alarm_two = function() {
		state = weapon_state.idle
	}
	
	static attack = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button(global.ATTACK_BUTTON)) && (clip >= 1)) {
					var _direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
					instance_create_layer(instance.x, instance.y, "instances", obj_projectile, { sprite_index: spr_bullet, speed: 10, direction: _direction, image_angle: _direction })
					clip -= 1
					state = weapon_state.cooldown
				}
				else if (((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((clip <= 0) && (mouse_check_button(global.ATTACK_BUTTON)))) && ammo != 0) {
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
				if (instance.alarm[2] == -1) {
					instance.alarm[2] = GUN_COOLDOWN_FRAMES
				} 
				break
		}
	}
}