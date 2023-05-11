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
			if (path_found) { path_start(path, 2, path_action_stop, false) }
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
			sprite_index = sprite_cooldown
			alarm[0] = 120
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
			sprite_index = sprite_lost 
			alarm[0] = 120
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
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			if (within_attack_radius) { return state.change("charging") }
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
	"charging", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charging 
			alarm[1] = 45
			attack_x = obj_player.x
			attack_y = obj_player.y
			path_end()
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			move_towards_point(attack_x, attack_y, 15)
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
if state.add(
	"death", {
		enter: function() {
			path_end()
			_speed = 0
			sprite_index = sprite_death
			audio_stop_all()
			audio_play_sound(snd_molten_death,1,false)
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			sprite_index = sprite_hurt
			path_end()
			alarm[0] = 10
		},
		step: function() {
			//kncokcback
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