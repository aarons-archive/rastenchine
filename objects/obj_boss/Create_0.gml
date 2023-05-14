event_inherited()
//sprites
sprite_idle          = spr_boss
sprite_chasing       = spr_boss_chasing
sprite_swipe_attack  = spr_boss_swipe_attack
sprite_charge_attack = spr_boss_charge_attack
sprite_cooldown      = spr_boss_charging//cooldown spr
sprite_death         = spr_boss
sprite_hurt          = spr_boss
//unique sprites
sprite_charging  = spr_boss_charging
//radi
swipe_attack_radius  = 250
charge_attack_radius = 400
chase_radius  = 700
_health = 120
//
attack_x = 0
attack_y = 0
charge_attack = 3
state = new SnowState("idle")
if state.add( 
	"Run", {
		enter: function() {
			
			boss_escape_zone = instance_furthest(x,y,obj_boss_spawn_zone)
			var path_found = mp_grid_path(global.mp_grid, path, x, y,
			boss_escape_zone.x, boss_escape_zone.y, true)
			if (path_found) { 
				path_start(path, _speed, path_action_stop, false)
				//audio_play_sound_on(s_emit,snd_growler_moving,true,1,global.enemy_audio)
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
			audio_play_sound(choose(snd_growler_idle1,snd_growler_idle2,snd_growler_idle3,snd_growler_idle4),1, false, global.enemy_audio)
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
			//audio_play_sound_on(s_emit,snd_growler_moving,true,1,global.enemy_audio)
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
			audio_stop_all()
			//audio_play_sound_on(s_emit,snd_growler_swipe_attack,false,1,global.enemy_audio)
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
			//audio_play_sound_on(s_emit,snd_growler_charge_attack,true,1,global.enemy_audio)
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
		}
	}
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			//audio_play_sound_on(s_emit,snd_boss_hurt,true,1,global.enemy_audio)
		},
	}
)
#endregion