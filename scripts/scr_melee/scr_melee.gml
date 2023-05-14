function Melee() : Weapon() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE           = undefined
	HAND_SPRITE      = undefined
	CHARGING_SPRITE  = undefined
	ATTACKING_SPRITE = undefined
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES = undefined
	ATTACK_FRAMES   = undefined
	
	////////////
	// charge //
	////////////
	MIN_CHARGE       = undefined
	MAX_CHARGE       = undefined
	CHARGE_PER_FRAME = undefined
	CHARGE_THRESHOLD = undefined
	charge       = MIN_CHARGE
	
	////////////
	// angles //
	////////////
	charge_angle = 0
	attack_angle = 0
	
	////////////
	// damage //
	////////////
	DEFAULT_DAMAGE = undefined
	damage = DEFAULT_DAMAGE
	
	////////////
	// inputs //
	////////////
	attack_input = false
	
	////////////
	// states //
	////////////
	state = new SnowState("idle")
	state.add(
		"idle", {
			step: function() {
				if (attack_input == true) { 
					return state.change("charging") 
				}
			}
		}
	)
	state.add(
		"charging", {
			enter: function() {
				instance.sprite_index = CHARGING_SPRITE
			},
			step: function() {
				charge = min(charge + CHARGE_PER_FRAME, MAX_CHARGE)
				charge_angle = (charge / MAX_CHARGE) * -20
				if (attack_input == false) {
					damage = (charge >= CHARGE_THRESHOLD) ? (DEFAULT_DAMAGE * charge) : (DEFAULT_DAMAGE) 
					with (
						instance_create_layer(
							obj_player.x, obj_player.y, 
							"player", obj_swing, 
							{ 
								sprite_index: spr_swing, 
								speed: 0, 
								direction: angle, 
								image_angle: angle, 
								image_xscale: 1 + (charge / 5), 
								image_yscale: 1 + (charge / 3),
								damage: damage
							}
						)
					) { 
						lifetime = other.ATTACK_FRAMES
					}
					return state.change("attacking")
				} 
			},
			leave: function() {
				charge_angle = 0
				instance.sprite_index = ATTACKING_SPRITE
			}
		}
	)
	state.add(
		"attacking", {
			enter: function() {
				instance.sprite_index = ATTACKING_SPRITE
				attack_angle = 180
			},
			step: function() {
				if (state.get_time(false) >= ATTACK_FRAMES) {
					return state.change("cooldown")
				}
			},
			leave: function() {
				instance.sprite_index = HAND_SPRITE
				attack_angle = 0
			}
		}
	)
	state.add(
		"cooldown", {
			step: function() {
				if (state.get_time(false) >= COOLDOWN_FRAMES) {
					charge = MIN_CHARGE
					damage = DEFAULT_DAMAGE
					return state.change("idle")
				}
			}
		}
	)

	static common = function() {
		angle = point_direction(obj_player._x, obj_player._y, mouse_x, mouse_y)
		// move the item away from the player by a certain distance 
		// in the direction of the cursor
		//var length_dir_x = lengthdir_x(distance + X_DISTANCE, angle) + X_OFFSET
		//var length_dir_y = lengthdir_y(distance + Y_DISTANCE, angle) + Y_OFFSET
		//var is_attacking = (state.get_current_state() == "attacking") 
		//instance.x = obj_player._x + ((is_attacking) ? (length_dir_x) : -(length_dir_x))
		//instance.y = obj_player._y + ((is_attacking) ? (length_dir_y) : -(length_dir_y))
		instance.x = obj_player._x + lengthdir_x(distance + X_DISTANCE, angle) + X_OFFSET
		instance.y = obj_player._y + lengthdir_y(distance + Y_DISTANCE, angle) + Y_OFFSET
		// change the items sprite angle depending on the direction
		// of the cursor
		instance.image_angle = angle + ((instance.image_yscale == 1) ? (-charge_angle) : (charge_angle))
		// flip the items sprite depending on if the item is on the 
		// left or right side of the screen
		var _y_scale = (angle_on_right_side(angle)) ? (1) : (-1)
		instance.image_yscale = lerp(instance.image_yscale, _y_scale, 0.25)
		// change the items depth depending on if the item is on the 
		// top or bottom side of the screen
		var _depth = (angle_on_top_side(angle)) ? (-1) : (1)
		instance.depth = obj_player.depth + _depth
	}
	
	static use = function() {
		attack_input = (mouse_check_button(global.ATTACK_BUTTON) == true)
		state.step()
	}
}