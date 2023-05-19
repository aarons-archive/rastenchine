event_inherited()		
//sprites
sprite_idle      = spr_spitter_moving //burrowed
sprite_wandering = spr_spitter_moving
sprite_chasing   = spr_spitter_moving //burrowed
sprite_lost      = spr_spitter_cooldown
sprite_attacking = spr_spitter_attack
sprite_cooldown  = spr_spitter_cooldown //burrowed
sprite_death     = spr_spitter_death
sprite_hurt      = spr_spitter_cooldown //hurt
//unique sprites
sprite_run = spr_spitter_moving //burrowed
//radi
vision_radius = 800
attack_radius = 250
chase_radius  = 600
//unique radi
run_radius    = 200
close_radius  = 150
//unique vars
shoot_cooldown = false
run_lock       = false
//idle sounds
idle_sounds  = choose(snd_spitter_idle_one,snd_spitter_idle_two,snd_spitter_idle_three)
moving_sound = snd_spitter_moving
hurt_sound   = snd_molten_hurt //snd_spitter_hurt
death_sound  = snd_molten_death //snd_spitter_death
attack_sound = snd_spitter_attack
burrow_sound = snd_spitter_burrow1
//State Machine
state = new SnowState("idle")

ALL_THE_STATES()

state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			path_end()
			sprite_index = sprite_attacking
			audio_stop_sound(moving_sound)
			audio_play_sound_on(s_emit,attack_sound,false,1,global.enemy_audio)
		},
		step: function() {
			if (shoot_cooldown == false) {
				if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1} 
				var _direction = point_direction(x, y, obj_player.x, obj_player.y)
				instance_create_layer( x, y, "enemies", obj_pea_bullets, 
				{ speed: 10, direction: _direction, image_angle: _direction })
				shoot_cooldown = true
				alarm[1] = 60
			}
			if !(within_attack_radius) { return state.change("attack_cooldown")}

			if (distance_to_player < run_radius) && run_lock == false && (alarm[2] == -1) {
				state.change("run")
			}
		}
	}
)
state.add(
	"attack_cooldown", {
		enter: function() {
			sprite_index = sprite_cooldown
			alarm[0] = 30
		}
	}
)
state.add(
	"run", {
		enter: function() {
			alarm[2] = 180
			run_lock = true
			sprite_index = sprite_run	
			alarm[3] = 30
			if audio_is_playing(moving_sound) {audio_stop_sound(moving_sound)}
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
		} , 
		step: function () {
			enemy_peashooter_run()
		}
	}
)