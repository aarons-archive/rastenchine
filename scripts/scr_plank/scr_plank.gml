#macro PLANK_DAMAGE 2

#macro PLANK_MIN_CHARGE       0
#macro PLANK_CHARGE_THRESHOLD 2
#macro PLANK_CHARGE_PER_FRAME 0.1
#macro PLANK_MAX_CHARGE       4

#macro PLANK_ATTACK_FRAMES   20
#macro PLANK_COOLDOWN_FRAMES 5

function Plank() : Melee() constructor {
	
	// from Item
	sprite = spr_plank
	
	// from Weapon
	damage = PLANK_DAMAGE
	
	// PLANK
	charge = PLANK_MIN_CHARGE
	static alarm_one = function() { state = weapon_state.cooldown }
	static alarm_two = function() { state = weapon_state.idle }
	
	static use = function() { 
		switch (state) {
			case weapon_state.idle:
				// start the charging state when the user presses the attack button.
				if (mouse_check_button(global.ATTACK_BUTTON)) {
					state = weapon_state.charging	
					instance.sprite_index = spr_plank_charging
				}
				break
			case weapon_state.charging:
				// increase the charge every frame up to its maximum.
				charge = min(charge + PLANK_CHARGE_PER_FRAME, PLANK_MAX_CHARGE)
				// start the attacking state when the user releases the attack button.
				if (mouse_check_button_released(global.ATTACK_BUTTON)) {
					state = weapon_state.attacking
					instance.sprite_index = spr_plank_attacking
					var _direction = (point_direction(instance.x, instance.y, mouse_x, mouse_y))
					with (instance_create_layer(obj_player.x, obj_player.y-15, "player", obj_swing, { sprite_index: spr_swing, speed: 0, direction: _direction, image_angle: _direction, image_xscale: 1 + (charge/5), image_yscale: 1 + (charge/3) })) lifetime = PLANK_ATTACK_FRAMES;
					// only apply the charge multiplier if the charge threshold has been met.
					if (charge >= PLANK_CHARGE_THRESHOLD) { 
						damage = PLANK_DAMAGE * charge 
					}
				}
				break
			case weapon_state.attacking:
				if (instance.alarm[1] == -1) { 
					// end attacking state after x amount of frames.
					instance.alarm[1] = PLANK_ATTACK_FRAMES
				}
				instance.image_angle -= 170
				var _direction = (point_direction(instance.x, instance.y, mouse_x, mouse_y))
				var _instx = obj_player.x + lengthdir_x(instance_offset, _direction)
				var _insty = instance.y = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset
				if (obj_player.sprite_index == spr_player_side && obj_player.image_xscale == 1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) - 10
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset + 30
					show_debug_message("Swing Right")
				}
				else if (obj_player.sprite_index == spr_player_side && obj_player.image_xscale != 1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) + 10
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset + 30
					show_debug_message("Swing Left")
				}
				else if (obj_player.sprite_index == spr_player_up && instance.image_yscale == 1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) + 10
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset + 30
					show_debug_message("Swing Up Right")
				}
				else if (obj_player.sprite_index == spr_player_up && instance.image_yscale == -1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) - 10
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset + 30
					show_debug_message("Swing Up Left")
				}
				else if (obj_player.sprite_index == spr_player_down && instance.image_yscale == 1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) - 20
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset - 10
					show_debug_message("Swing Down Right")
				}
				else if (obj_player.sprite_index == spr_player_down && instance.image_yscale == -1)
				{
					_instx = obj_player.x + lengthdir_x(instance_offset, _direction) + 20
					_insty = obj_player.y + lengthdir_y(instance_offset, _direction) + instance_y_offset - 10
					show_debug_message("Swing Down Left")
				}
				instance.x = _instx
				instance.y = _insty
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					// end cooldown state after x amount of frames.
					instance.alarm[2] = PLANK_COOLDOWN_FRAMES
					instance.sprite_index = spr_plank
					// reset damage and charge vars.
					damage = PLANK_DAMAGE
					charge = PLANK_MIN_CHARGE
				}
				break
		}
	}
}