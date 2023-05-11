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
//
idle_sounds = choose(snd_molten_idle1,snd_molten_idle2,snd_molten_idle3,snd_molten_idle4)

state = new SnowState("idle")
state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle
			audio_stop_all()
			
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
			sprite_index = sprite_wandering
			if (created_by_spawner) {
				wander_x = irandom_range(spawner_bbox_left - 100, spawner_bbox_right + 100)
				wander_y = irandom_range(spawner_bbox_top - 100, spawner_bbox_bottom + 100)
			}
			else {
				wander_x = irandom_range(bbox_left - 200, bbox_right + 200)
				wander_y = irandom_range(bbox_top - 200, bbox_bottom + 200)
			}
			var path_found = mp_grid_path(global.mp_grid, path, x, y, wander_x, wander_y, irandom_range(0, 1))
			if (path_found) { path_start(path, 2, path_action_stop, false)}
			audio_play_sound(snd_molten_moving,1,true)
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
			sprite_index = sprite_cooldown
			alarm[0] = 120
			audio_stop_all()
			audio_play_sound(idle_sounds,1, false)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)

state.add(
	"lost", {
		enter: function() { 
			sprite_index = sprite_lost 
			alarm[0] = 120
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
			audio_play_sound(snd_molten_moving,1,true)
		},
		step: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			if (within_attack_radius) { return state.change("attacking") }
			if (!within_chase_radius) { return state.change("lost") }
			path_cooldown -= 1
			if (path_cooldown <= 0) {
				path_cooldown = 20
				var path_found = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, true)
				if (path_found) { path_start(path, _speed, path_action_stop, false) }
			}
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			audio_stop_all()
			audio_play_sound(snd_molten_attack,1,false)
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
			path_end()
			_speed = 0
			sprite_index = sprite_death
			audio_stop_all()
			audio_play_sound(snd_leaper_death,1,false)
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			sprite_index = sprite_hurt
			path_end()
			alarm[0] = 30
		},
		step: function() {
			//knockback
			if instance_exists(obj_projectile) {
				var knockback = 5
				var knock_dir = point_direction(x, y, obj_projectile.x, obj_projectile.y) 
				var knockback_x = lengthdir_x(knockback,  knock_dir)
				var knockback_y = lengthdir_y(knockback,  knock_dir) 
				if (place_meeting(x + knockback_x, y, obj_player_collision)) {
					while (not place_meeting(x + sign(knockback_x), y, obj_player_collision)) {
						x += sign(knockback_x)
					}
					knockback_x = 0
				}
				if (place_meeting(x, y + knockback_y, obj_player_collision)) {
					while (not place_meeting(x, y + sign(knockback_y), obj_player_collision)) {
						y += sign(knockback_y)
					}
					knockback_y = 0
				}
				x -= knockback_x
				y -= knockback_y 
			}			
		}
	}
)
#endregion