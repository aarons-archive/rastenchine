event_inherited()		
//sprites
sprite_idle      = spr_pea_shooter_burrowed //burrowed
sprite_wandering = spr_pea_shooter
sprite_chasing   = spr_pea_shooter_burrowed_angry //burrowed
sprite_lost      = dev_basic_enemy_cooldown
sprite_attacking = spr_pea_shooter
sprite_cooldown  = spr_pea_shooter_burrowed //burrowed
sprite_death     = dev_basic_enemy_cooldown
sprite_hurt      = spr_pea_shooter
//unique sprites
sprite_run = spr_pea_shooter_burrowed //burrowed
//radi
vision_radius = 800
attack_radius = 250
chase_radius  = 600
//unique radi
run_radius = 200
close_radius = 150
//unique vars
shoot_cooldown = false
run_lock = false

state = new SnowState("idle")
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle 
			audio_stop_all()
			//audio_play_sound_on(s_emit,choose(),true,1,global.enemy_audio)
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
			//audio_play_sound_on(s_emit,snd_peashooter_moving,true,1,global.enemy_audio)
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
			//audio_play_sound_on(s_emit,snd_peashooter_moving,true,1,global.enemy_audio)
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
			path_end()
			sprite_index = sprite_attacking
		},
		step: function() {
			if (shoot_cooldown == false) {
				if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1} 
				var _direction = point_direction(x, y, obj_player.x, obj_player.y)
				instance_create_layer( x, y, "enemies", obj_pea_bullets, 
				{ speed: 10, direction: _direction, image_angle: _direction })
				//audio_play_sound_on(s_emit,snd_peashooter_attack,true,1,global.enemy_audio)
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
			_speed = 0
			path_end()
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
			//audio_play_sound_on(s_emit,snd_peashooter_moving,true,1,global.enemy_audio)
		} , 
		step: function () {
			enemy_peashooter_run()
		}
	}
)
#region universal states
if state.add(
	"death", {
		enter: function() {
			enemy_death()
			//audio_play_sound_on(s_emit,snd_peashooter_death,true,1,global.enemy_audio)
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			//audio_play_sound_on(s_emit,snd_peashooter_hurt,true,1,global.enemy_audio)
		},
		step: function() {
			//knockback
			enemy_knockback()
		}			
	}
)
#endregion
//burrowed = untargetable do this in player