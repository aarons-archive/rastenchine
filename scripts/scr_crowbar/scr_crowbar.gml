#macro CROWBAR_DAMAGE 2

#macro CROWBAR_MIN_CHARGE       0
#macro CROWBAR_CHARGE_THRESHOLD 2
#macro CROWBAR_CHARGE_PER_FRAME 0.1
#macro CROWBAR_MAX_CHARGE       4

#macro CROWBAR_ATTACK_FRAMES   20
#macro CROWBAR_COOLDOWN_FRAMES 40

function Crowbar() : Weapon() constructor {
	
	// from Item
	sprite = spr_crowbar
	
	// from Weapon
	damage = CROWBAR_DAMAGE
	
	// Crowbar
	charge = CROWBAR_MIN_CHARGE
	static alarm_one = function() { state = weapon_state.cooldown }
	static alarm_two = function() { state = weapon_state.idle }
	
	static use = function() { 
		switch (state) {
			case weapon_state.idle:
				// start the charging state when the user presses the attack button.
				if (mouse_check_button(global.ATTACK_BUTTON)) {
					state = weapon_state.charging	
					instance.sprite_index = spr_crowbar_charging
				}
				break
			case weapon_state.charging:
				// increase the charge every frame up to its maximum.
				charge = min(charge + CROWBAR_CHARGE_PER_FRAME, CROWBAR_MAX_CHARGE)
				// start the attacking state when the user releases the attack button.
				if (mouse_check_button_released(global.ATTACK_BUTTON)) {
					state = weapon_state.attacking
					instance.sprite_index = spr_crowbar_attacking
					// only apply the charge multiplier if the charge threshold has been met.
					if (charge >= CROWBAR_CHARGE_THRESHOLD) { 
						damage = CROWBAR_DAMAGE * charge 
					}
				}
				break
			case weapon_state.attacking:
				if (instance.alarm[1] == -1) { 
					// end attacking state after x amount of frames.
					instance.alarm[1] = CROWBAR_ATTACK_FRAMES
				}
				break
			case weapon_state.cooldown:
				if (instance.alarm[2] == -1) {
					// end cooldown state after x amount of frames.
					instance.alarm[2] = CROWBAR_COOLDOWN_FRAMES
					instance.sprite_index = spr_crowbar
					// reset damage and charge vars.
					damage = CROWBAR_DAMAGE
					charge = CROWBAR_MIN_CHARGE
				}
				break
		}
	}
}