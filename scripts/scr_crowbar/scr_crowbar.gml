function Crowbar() : Weapon() constructor {
	
	sprite = spr_crowbar
	
	DEFAULT_DAMAGE = 5
	damage = DEFAULT_DAMAGE
	
	DEFAULT_CHARGE = 0
	MAX_CHARGE = 10
	charge = DEFAULT_CHARGE

	static alarm_one = function() {
		state = weapon_state.cooldown
	}
	static alarm_two = function() {
		state = weapon_state.idle
	}
	
	static attack = function() { 
		switch (state) {
			case weapon_state.idle:
				// start charge state when the user presses the attack button.
				if (mouse_check_button(global.ATTACK_BUTTON)) {
					state = weapon_state.charging	
					instance.sprite_index = spr_crowbar_charging
				}
				break
			case weapon_state.charging:
				// increase the charge by 0.1 every frame, up to a max of 10.0 charge.
				charge = min(charge + 0.1, MAX_CHARGE)
				// start attack state when the user releases the attack button.
				if (mouse_check_button_released(global.ATTACK_BUTTON)) {
					state = weapon_state.attacking
					instance.sprite_index = spr_crowbar_attacking
					// only multiply damage if enough charge has built up.
					if (charge >= 2) { damage = DEFAULT_DAMAGE * charge }
				}
				break
			case weapon_state.attacking:
				// guard against alarm being set every step.
				if (instance.alarm[1] == -1) { 
					// end attack state after 20 frames.
					instance.alarm[1] = 20
				}
				break
			case weapon_state.cooldown:
				// guard against alarm being set every step.
				if (instance.alarm[2] == -1) {
					// reset damage, charge, and sprite variables.
					damage = DEFAULT_DAMAGE
					charge = DEFAULT_CHARGE
					instance.sprite_index = spr_crowbar
					// end cooldown state after 40 frames.
					instance.alarm[2] = 60
				}
				break
		}
		
	}
}