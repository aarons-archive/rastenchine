event_inherited()
//sprites
sprite_idle      = spr_shambler_idle
sprite_wandering = spr_shambler_moving
sprite_chasing   = spr_shambler_moving
sprite_lost      = dev_shambler_cooldown
sprite_attacking = spr_shambler_explode
sprite_cooldown  = dev_shambler_cooldown
sprite_death     = spr_shambler_death
sprite_hurt      = dev_shambler
//unique sprites
sprite_sleeping = spr_shambler_sleeping
sprite_charging = spr_shambler_charging
//radi
vision_radius = 500
attack_radius = 100
chase_radius  = 300
//unique vars
explode_timer = 0
//
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
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle
			audio_stop_sound(s_emit)
			audio_play_sound_on(s_emit,choose(snd_shambler_idle1,snd_shambler_idle2,snd_shambler_idle3,snd_shambler_idle4,snd_shambler_idle5),true,1,global.enemy_audio)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
			if (within_vision_radius) { return state.change("wandering") }	
		}
	}
) 

state.add(
	"wandering", {
		enter: function() { 
			enemy_wandering()
			audio_play_sound_on(s_emit,snd_shambler_moving1,true,1,global.enemy_audio)
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
			audio_play_sound_on(s_emit,snd_shambler_moving1,true,1,global.enemy_audio)
		},
		step: function() {
			enemy_chasing(true)
		}
	}
)
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
			instance_create_layer(x,y,"enemies",obj_shambler_explosion)
			path_end()
			audio_stop_sound(s_emit)
			audio_play_sound_on(s_emit,snd_shambler_explode,false,1,global.enemy_audio)
		},
		step: function() {
			if (image_index	>= image_number - 1) {
				instance_destroy()
			}
		}
	}
)
#region universal states
if state.add(
	"death", {
		enter: function() {
			enemy_death()	
			//audio_play_sound_on(s_emit,snd_shambler_death,true,1,global.enemy_audio)
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			//audio_play_sound_on(s_emit,snd_shambler_hurt,true,1,global.enemy_audio)
		},
		step: function() {
			//knockback
			enemy_knockback()
		}			
	}
)
#endregion