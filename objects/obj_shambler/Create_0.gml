event_inherited()
//health
_health = 40
//sprites
sprite_idle      = spr_shambler_idle
sprite_wandering = spr_shambler_moving
sprite_chasing   = spr_shambler_moving
sprite_lost      = spr_shambler_cooldown
sprite_attacking = spr_shambler_explode
sprite_cooldown  = spr_shambler_cooldown
sprite_death     = spr_shambler_death
sprite_hurt      = spr_shambler_cooldown
//unique sprites
sprite_sleeping  = spr_shambler_sleeping
sprite_charging  = spr_shambler_charging
//radi
vision_radius = 500
attack_radius = 100
chase_radius  = 300
//unique vars
explode_timer = 0
//idle sounds
idle_sounds  = choose(snd_shambler_idle_one,snd_shambler_idle_two,snd_shambler_idle_three,snd_shambler_idle_four)
moving_sound = snd_shambler_moving_one
hurt_sound   = snd_molten_hurt //snd_shambler_hurt
death_sound  = snd_molten_death //snd_shambler_death 
attack_sound = snd_shambler_explode
//State Machine
state = new SnowState("sleeping")
//sleeping during night hours wandering through day hours 
state.add(
	"sleeping", {
		enter: function() {
			sprite_index = sprite_sleeping
			audio_stop_sound(s_emit)
		},
		step: function() {
			//will also need cheese item + must be crouching?
			if (collision_circle(x, y, 50, obj_player, false, false)) && keyboard_check_pressed(ord("E")){
				instance_create_layer(x,y,"other",obj_tamed_shambler)
				instance_destroy()
			}
			if (within_chase_radius) { return state.change("chasing") }
			if (within_vision_radius) { return state.change("wandering") }	
		}
	}
) 
state = new SnowState("idle")
state.add(
	"idle", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
ALL_THE_STATES()
state.add(
	"wandering", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"wandering_cooldown", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"lost", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"chasing", {
		step: function() {
			enemy_chasing(true)
		}
	}
)
ALL_THE_STATES()

state.add(
	"charging", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charging 
			path_end()
		},
		step: function() {
			explode_timer += 0.1
			if !(within_attack_radius){
				explode_timer -= 0.2
				if explode_timer <= 0 { 
					explode_timer = 0
					state.change("chasing")
				}
			}
			if explode_timer >= 8 {state.change("attacking")}
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			instance_create_layer(x,y,"enemies",obj_explosion)
			path_end()
			audio_stop_sound(moving_sound)
			audio_play_sound_on(s_emit,attack_sound,false,1,global.enemy_audio)
		},
		step: function() {
			if (image_index	>= image_number - 1) {
				instance_destroy()
			}
		}
	}
)
