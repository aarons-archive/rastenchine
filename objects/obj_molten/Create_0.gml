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
idle_sounds  = choose(snd_molten_idle_one,snd_molten_idle_two,snd_molten_idle_three)
moving_sound = snd_molten_moving
hurt_sound   = snd_molten_hurt
death_sound  = snd_molten_death
attack_sound = snd_molten_attack
//State machine
state = new SnowState("idle")
ALL_THE_STATES()
state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			audio_stop_sound(moving_sound)
			audio_play_sound_on(s_emit,attack_sound,false,1,global.enemy_audio)
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
