event_inherited()

sprite_idle = spr_leaper
sprite_chasing = spr_leaper_chasing
sprite_lost = spr_leaper_lost
sprite_charging = spr_leaper_charging
sprite_attacking = spr_leaper_attacking
sprite_death = spr_basic_enemy_death

vision_radius = 750
chase_radius = 500
attack_radius = 250

within_vision_radius = false
within_chase_radius = false
within_attack_radius = false

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
		}
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
			alarm[2] = 120
		},
	}
)
state.add(
	"attacking", {
		enter: function() { 
			sprite_index = sprite_attacking 
			var path_created = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, true)
			path_start(path, 10, path_action_stop, false)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision)) {
				path_end()
			}
		}
	}
)