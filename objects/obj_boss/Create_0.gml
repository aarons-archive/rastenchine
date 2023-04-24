event_inherited()
//sprites
sprite_idle          = spr_boss
sprite_chasing       = spr_boss_chasing
sprite_swipe_attack  = spr_boss_swipe_attack
sprite_charge_attack = spr_boss_charge_attack
sprite_cooldown      = spr_boss_charging//cooldown spr
sprite_death         = spr_boss
//unique sprites
sprite_charging  = spr_boss_charging

//radi
swipe_attack_radius = 200
charge_attack_radius = 400
chase_radius  = 1000
//
attack_x = 0
attack_y = 0

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
			if (swipe_attack_radius) { return state.change("swipe_attack") }
			charge_attack = irandom_range(1,10)
			if  (charge_attack <= 2) && (charge_attack_radius) { return state.change("charging") }
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
	"swipe_attack", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_swipe_attack
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
	"charge_attack", {
		enter: function() {
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charge_attack
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
