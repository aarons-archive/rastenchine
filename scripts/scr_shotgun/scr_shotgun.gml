#macro SHOTGUN_DAMAGE 20
#macro SHOTGUN_RANGE 15

#macro SHOTGUN_MAX_AMMO 10
#macro SHOTGUN_CLIP     2

#macro SHOTGUN_RELOAD_FRAMES   FPS * 1
#macro SHOTGUN_COOLDOWN_FRAMES FPS * 0.4

function Shotgun() : Weapon() constructor {

	// from Item
	sprite = spr_shotgun
	
	// from Weapon
	damage = SHOTGUN_DAMAGE
	
	// SHOTGUN
	ammo = SHOTGUN_MAX_AMMO
	clip = SHOTGUN_CLIP

	static alarm_one = function() {
		state = weapon_state.idle
		instance.sprite_index = spr_shotgun
		if ((clip + ammo) < SHOTGUN_CLIP) {
			clip = ammo
			ammo = 0
		}
		else {
			ammo -= (SHOTGUN_CLIP - clip)
			clip = SHOTGUN_CLIP
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
					var _spread_direction = _direction - 10;
					repeat 4
					{
						with (instance_create_layer(instance.x, instance.y, "other", obj_projectile, { sprite_index: spr_bullet, speed: 10, direction: _spread_direction, image_angle: _direction })) lifetime = SHOTGUN_RANGE;
						_spread_direction += irandom_range(5, 10)
					}
					clip -= 1
					state = weapon_state.cooldown
				}
				else if (((keyboard_check_pressed(global.RELOAD_GUN_KEY)) || ((clip <= 0) && (mouse_check_button(global.ATTACK_BUTTON)))) && ammo != 0) {
					state = weapon_state.reloading
					instance.sprite_index = spr_shotgun_reloading
				}
				break
			case weapon_state.reloading:
				if (instance.alarm[1] == -1) {
					instance.alarm[1] = SHOTGUN_RELOAD_FRAMES
				} 
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					instance.alarm[2] = SHOTGUN_COOLDOWN_FRAMES
				} 
				break
		}
	}
}