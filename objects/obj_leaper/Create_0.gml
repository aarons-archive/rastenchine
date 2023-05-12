event_inherited()
//sprites
sprite_idle      = spr_leaper_idle
sprite_wandering = spr_leaper_chase //wander sprite
sprite_chasing   = spr_leaper_chase
sprite_lost      = spr_leaper_cooldown
sprite_attacking = spr_leaper_attack
sprite_cooldown  = spr_leaper_cooldown
sprite_death     = spr_leaper_death
sprite_hurt      = spr_leaper_cooldown
//unique sprites
sprite_charging = spr_leaper_charge
//radi
vision_radius = 600
attack_radius = 200
chase_radius  = 400
//
attack_x = 0
attack_y = 0

state = new SnowState("idle")
#region Same for all enemies
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle 
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
			if (within_vision_radius) { return state.change("wandering") }	
			//unique to leaper
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"wandering", {
		enter: function() { 
			enemy_wandering()
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
			if (path_position == 1) { state.change("wandering_cooldown") }
			//unique to leaper
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"wandering_cooldown", {
		enter: function() { 
			enemy_wandering_cooldown()
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
state.add(
	"lost", {
		enter: function() { 
			enemy_lost()
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
#endregion

state.add(
	"chasing", {
		enter: function() { 
			sprite_index = sprite_chasing 
		},
		step: function() {
			enemy_chasing(true)
		}
	}
)

#region ATTACKS
state.add(
	"charging", {
		enter: function() {
			if (obj_player._x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charging
			attack_x = obj_player.x
			attack_y = obj_player.y
			path_end()
			alarm[1] = 45
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player._x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			move_towards_point(attack_x, attack_y, 10)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision) || distance_to_point(attack_x, attack_y) <= 10) {
				speed = 0
				state.change("attack_cooldown")
			}
		}
	}
)
state.add(
	"attack_cooldown", {
		enter: function() { 
			sprite_index = sprite_cooldown
			alarm[0] = 120
		}
	}
)
#endregion
#region universal states
if state.add(
	"death", {
		enter: function() {
			enemy_death()
			audio_play_sound(snd_leaper_death,1,false,global.enemy_audio)
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
		},
		step: function() {
			//knockback
			enemy_knockback()
		}			
	}
)
#endregion