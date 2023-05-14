event_inherited()
randomize()
//sprites
sprite_idle      = spr_molten_idle
sprite_wandering = spr_molten_chase
sprite_chasing   = spr_molten_chase
sprite_lost      = spr_molten_idle
sprite_attacking = spr_molten_attack
sprite_cooldown  = spr_molten_cooldown
sprite_death     = spr_molten_death
sprite_hurt      = spr_molten_cooldown //hurt sprite
//radi
vision_radius = 500
attack_radius = 15
chase_radius  = 300
//idle sounds
idle_sounds  = choose(snd_molten_idle1,snd_molten_idle2,snd_molten_idle3)
moving_sound = snd_molten_moving
alarm[9] = 120
//State machine
state = new SnowState("idle")
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle
		},
		step: function() {
			//If the player is within either of these ranges the enemy will move into the required state
			if (within_chase_radius) { return state.change("chasing") }
			if (within_vision_radius) { return state.change("wandering") }	
		}
	}
)
state.add(
	"wandering", {
		enter: function() { 
			enemy_wandering()
			//audio_stop_sound(s_emit)
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
			if (path_position == 1) { state.change("wandering_cooldown") }
		}
	}
)
state.add(
	"wandering_cooldown", {
		enter: function() { 
			enemy_wandering_cooldown()
			audio_stop_sound(moving_sound)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
state.add(
	"lost", {
		enter: function() { 
			enemy_lost()
			audio_stop_sound(moving_sound)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
state.add(
	"chasing", {
		enter: function() { 
			sprite_index = sprite_chasing
			if !audio_is_playing(moving_sound){
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
			}
		},
		step: function() {
			enemy_chasing()
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			//audio_stop_sound(s_emit)
			audio_play_sound_on(s_emit,snd_molten_attack,false,1,global.enemy_audio)
			_speed = 0
			path_end()
		},
		step: function() {
			if (image_index	>= image_number - 1) {
				state.change("attack_cooldown")
			}
		}
	}
)
state.add(
	"attack_cooldown", {
		enter: function() { 
			sprite_index = sprite_cooldown
			alarm[0] = 60
		}
	}
)
#region universal states
if state.add(
	"death", {
		enter: function() {
			audio_play_sound_on(s_emit,snd_molten_death,false,1,global.enemy_audio)
			enemy_death()
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			//audio_stop_all()
			audio_play_sound_on(s_emit,snd_molten_death,false,1,global.enemy_audio)
		},
		step: function() {
			//knockback
			enemy_knockback()
			}			
		}
)
#endregion