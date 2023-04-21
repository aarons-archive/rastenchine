event_inherited()
//sprites
sprite_idle      = spr_boss
sprite_chasing   = spr_boss
sprite_attacking = spr_boss
sprite_cooldown  = spr_boss
//sprite_death     = spr_boss
//radi
attack_radius = 20
chase_radius  = 300

state = new SnowState("idle")
if state.add(
	"death", {
		enter: function() {
			path_end()
			_speed = 0
			sprite_index = sprite_death
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
		},
		step: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			//if (within_attack_radius) { return state.change("attacking") }
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
	"attacking1", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			_speed = 0
			path_end()
		},
		step: function() {
			if (image_index	== image_number - 1) {
				state.change("attack_cooldown")
			}
		}
	}
)
state.add(
	"attacking2", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			_speed = 0
			path_end()
		},
		step: function() {
			if (image_index	== image_number - 1) {
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
