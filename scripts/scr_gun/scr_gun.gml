function Gun() : Weapon() constructor {
	////////////
	// sprite //
	////////////
	DEFAULT_SPRITE = undefined
	COOLDOWN_SPRITE = undefined
	RELOADING_SPRITE = undefined
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES = undefined
	RELOADING_FRAMES = undefined
	
	//////////
	// ammo //
	//////////
	DEFAULT_AMMO = undefined
	DEFAULT_CLIP = undefined
	ammo = DEFAULT_AMMO
	clip = DEFAULT_CLIP
	
	////////////
	// inputs //
	////////////
	attack_input = false
	reload_input = false
	
	////////////
	// states //
	////////////
	state = new SnowState("idle")
	state.add(
		"idle", {
			step: function() {
				if ((attack_input == true) and (clip >= 1)) { 
					return state.change("shooting") 
				}
				if ((reload_input == true) or ((attack_input == true) and (clip <= 0) and (ammo >= 1))) { 
					return state.change("reloading")
				}
			}
		}
	)
	state.add(
		"cooldown", {
			enter: function() {
				instance.sprite_index = COOLDOWN_SPRITE
			},
			step: function() {
				offset = lerp(offset, ITEM_OFFSET, 0.25)
				if (state.get_time(false) >= COOLDOWN_FRAMES) { 
					return state.change("idle") 
				}
			},
			leave: function() {
				instance.sprite_index = DEFAULT_SPRITE
			}
		}
	)
	state.add(
		"reloading", {
			enter: function() {
				instance.sprite_index = RELOADING_SPRITE
			},
			step: function() {
				if (state.get_time(false) >= RELOADING_FRAMES) {
					var missing = DEFAULT_CLIP - clip
					clip += (missing > ammo) ? (ammo) : (missing)
					ammo -= (missing > ammo) ? (ammo) : (missing)
					return state.change("idle")
				}
			},
			leave: function() {
				instance.sprite_index = DEFAULT_SPRITE
			}
		}
	)
	
	static use = function() {
		attack_input = (mouse_check_button(global.ATTACK_BUTTON) == true)
		reload_input = (keyboard_check_pressed(global.RELOAD_KEY) == true)
		state.step()
	}
}
