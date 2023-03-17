event_inherited()

sprite_idle = spr_leaper
sprite_wandering = spr_leaper_wandering
sprite_chasing = spr_leaper_chasing
sprite_lost = spr_leaper_lost
sprite_charging = spr_leaper_charging
sprite_attacking = spr_leaper_attacking
sprite_cooldown = spr_leaper_cooldown
sprite_death = spr_basic_enemy_death

vision_radius = 750
chase_radius = 500
attack_radius = 250

within_vision_radius = false
within_chase_radius = false
within_attack_radius = false

target_x = 0
target_y = 0

state = new SnowState("idle")

state.add(
	"idle", {
		enter: function() { sprite_index = sprite_idle },
		step: function() {
			if (within_vision_radius) { return state.change("wandering") }
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
state.add(
	"wandering", {
		enter: function() { sprite_index = sprite_wandering },
		step: function() {
			if (!within_vision_radius) { return state.change("idle") }
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)

state.add(
	"chasing", {
		enter: function() { 
			sprite_index = sprite_chasing 
			alarm[1] = -1
		},
		step: function() {
			if (!within_chase_radius) { return state.change("lost") }
			if (within_attack_radius) { return state.change("charging") }
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
			alarm[1] = 120
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)

state.add(
	"charging", {
		enter: function() { 
			sprite_index = sprite_charging 
			alarm[2] = 30
			path_end()
			target_x = obj_player.x
			target_y = obj_player.y
		},
	}
)
state.add(
	"attacking", {
		enter: function() { 
			sprite_index = sprite_attacking
			move_towards_point(target_x, target_y, 10)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision) || distance_to_point(target_x, target_y) < 1) {
				speed = 0
				state.change("cooldown")
			}
		}
	}
)
state.add(
	"cooldown", {
		enter: function() { 
			sprite_index = sprite_cooldown
			alarm[3] = 45
		},
	}
)