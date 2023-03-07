#macro RAILGUN_DAMAGE 20
#macro RAILGUN_RANGE 15

#macro RAILGUN_MAX_AMMO 40
#macro RAILGUN_CLIP     1

#macro RAILGUN_RELOAD_FRAMES   FPS * 1
#macro RAILGUN_COOLDOWN_FRAMES FPS * 0.4

function Railgun() : Weapon() constructor {

	// from Item
	sprite = spr_railgun
	
	// from Weapon
	damage = RAILGUN_DAMAGE
	
	// RAILGUN
	ammo = RAILGUN_MAX_AMMO
	clip = RAILGUN_CLIP

	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_railgun
		if ((clip + ammo) < RAILGUN_CLIP) {
			clip = ammo
			ammo = 0
		}
		else {
			ammo -= (RAILGUN_CLIP - clip)
			clip = RAILGUN_CLIP
		}
	}
	
	static alarm_two = function() { 
		state = weapon_state.idle 
	}
	
	static use = function() {
		switch (state) {
			case weapon_state.idle:
				if ((mouse_check_button(global.ATTACK_BUTTON)) && (clip >= 1)) {
					var _direction = point_direction(instance.x, instance.y, mouse_x, mouse_y)
					with (instance_create_layer(instance.x, instance.y, "other", obj_projectile, { sprite_index: spr_rail_bullet, speed: 0, direction: _direction, image_angle: _direction, image_xscale: 500 })) lifetime = GUN_RANGE;
					instance_offset = 0;
					clip -= 1
					state = weapon_state.cooldown
				}
				else if (((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((clip <= 0) && (mouse_check_button(global.ATTACK_BUTTON)))) && ammo != 0) {
					state = weapon_state.reloading
					instance.sprite_index = spr_railgun_reloading
				}
				break
			case weapon_state.reloading:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = RAILGUN_RELOAD_FRAMES
				} 
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					instance.alarm[2] = RAILGUN_COOLDOWN_FRAMES
				} 
				instance_offset = lerp(instance_offset, 25, 0.1);
				break
		}
	}
}