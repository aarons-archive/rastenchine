event_inherited()

sprite_idle = spr_leaper
sprite_wandering = spr_leaper_wandering
sprite_wandering_cooldown = spr_leaper_wandering_cooldown
sprite_chasing = spr_leaper_chasing
sprite_lost = spr_leaper_lost
sprite_charging = spr_leaper_charging
sprite_attacking = spr_leaper_attacking
sprite_attacking_cooldown = spr_leaper_attacking_cooldown
sprite_death = spr_basic_enemy_death

attack_radius = 250
chase_radius = 500
vision_radius = 750

within_attack_radius = false
within_chase_radius = false
within_vision_radius = false

wander_x = 0
wander_y = 0

attack_x = 0
attack_y = 0

state = new SnowState("idle")

state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle 
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
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
			var found_path = mp_grid_path(global.mp_grid, path, x, y, wander_x, wander_y, irandom_range(0, 1))
			if (found_path) { path_start(path, 2, path_action_stop, false) }
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
			if (within_chase_radius) { return state.change("chasing") }
			if (!within_vision_radius) { return state.change("idle") }
			if (path_position == 1) { state.change("wandering_cooldown") }
		}
	}
)
state.add(
	"wandering_cooldown", {
		enter: function() { 
			sprite_index = sprite_wandering_cooldown
			alarm[0] = 120
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
			if (within_chase_radius) { return state.change("chasing") }
			if (!within_vision_radius) { return state.change("idle") }
		}
	}
)

state.add(
	"chasing", {
		enter: function() { 
			sprite_index = sprite_chasing 
		},
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
			if (!within_chase_radius) { return state.change("lost") }
			if (!within_vision_radius) { return state.change("idle") }
			
			var _dis = distance_to_object(obj_player)
			//can start chasing? or ready for attack
			if (_dis <= chase_radius && _dis > attack_radius) {
				//should calc path?
				if (path_timer-- <= 0) {
					//reset timer
					path_timer = path_delay;
					//can make path to player
					if (x == _x and y == _y) { var _type = 0 } else { var _type = 1}
					var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, _type);
					//start path if can reach the player
					if (_found_player) {
						path_start(path, _speed, path_action_stop, false);
					}
				} 
				else if (_dis < obj_enemy) {
					path_end()
				}
			}
		},
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
			if (!within_vision_radius) { return state.change("idle") }
		}
	}
)

state.add(
	"charging", {
		enter: function() { 
			sprite_index = sprite_charging 
			alarm[1] = 30
			attack_x = obj_player.x
			attack_y = obj_player.y
			path_end()
		},
	}
)
state.add(
	"attacking", {
		enter: function() { 
			sprite_index = sprite_attacking
			move_towards_point(attack_x, attack_y, 15)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision) || distance_to_point(attack_x, attack_y) < 1) {
				speed = 0
				state.change("attack_cooldown")
			}
		}
	}
)
state.add(
	"attack_cooldown", {
		enter: function() { 
			sprite_index = sprite_attacking_cooldown
			alarm[0] = 120
		},
	}
)