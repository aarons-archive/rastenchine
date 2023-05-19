event_inherited()
//sprites
sprite_idle          = dev_boss
sprite_chasing       = spr_growler_moving
sprite_swipe_attack  = spr_growler_swipe_attack
sprite_charge_attack = spr_growler_charge_attack
sprite_cooldown      = spr_growler_cooldown
sprite_death         = dev_boss
sprite_hurt          = spr_growler_cooldown
//unique sprites
sprite_charging      = spr_growler_charging
//radi
swipe_attack_radius  = 250
charge_attack_radius = 400
chase_radius  = 700
_health = 120
//
attack_x = 0
attack_y = 0
charge_attack = 3
//idle sounds
idle_sounds  = choose(snd_growler_idle_one,snd_growler_idle_two,snd_growler_idle_three,snd_growler_idle_four)
moving_sound = snd_growler_moving
hurt_sound   = snd_molten_hurt //snd_growler_hurt
death_sound  = snd_molten_death //snd_growler_death 
attack_sound = snd_molten_attack //snd_growler_attack
//State Machine
state = new SnowState("idle")
if state.add( 
	"Run", {
		enter: function() {
			
			boss_escape_zone = instance_furthest(x,y,obj_boss_spawn_zone)
			var path_found = mp_grid_path(global.mp_grid, path, x, y,
			boss_escape_zone.x, boss_escape_zone.y, true)
			if (path_found) { 
				path_start(path, _speed, path_action_stop, false)
				if audio_is_playing(moving_sound) {audio_stop_sound(moving_sound)}
				audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
			}
		} , 
		step: function() {
			if distance_to_object(boss_escape_zone) < 150 {instance_destroy()}
		}
	}	
)
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle
		},
		step: function() {
			//time instead of range
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
) 

state.add(
	"chasing", {
		enter: function() { 
			sprite_index = sprite_chasing
			alarm[3] = 600
			if audio_is_playing(moving_sound) {audio_stop_sound(moving_sound)}
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
			//music?
		},
		step: function() {
			enemy_chasing()
		}
	}
)
state.add(
	"swipe_attack", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_swipe_attack
			_speed = 0
			path_end()
			audio_stop_sound(moving_sound)
			//audio_play_sound_on(s_emit,sound_swipe_attack,false,1,global.enemy_audio)
		},
		step: function() {
			if (image_index	>= image_number - 1) {
				state.change("attack_cooldown")
			}
		}
	}
)
state.add(
	"charging", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			charge_attack = 3
			sprite_index = sprite_charging 
			alarm[1] = 45
			attack_x = obj_player.x
			attack_y = obj_player.y
			path_end()
		}
	}
)
state.add(
	"charge_attack", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charge_attack
			move_towards_point(attack_x, attack_y, 15)
			audio_stop_all()
			//audio_play_sound_on(s_emit,sound_charge_attack,true,1,global.enemy_audio)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision) || distance_to_point(attack_x, attack_y) <= 1) {
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
#region universal states
state.add(
	"death", {
		enter: function() {
			state.change("Run")
			//sound here maybe?
		}
	}
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			//audio_play_sound_on(s_emit,hurt_sound,true,1,global.enemy_audio)
		},
	}
)
#endregion