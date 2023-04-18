event_inherited()		
//sprites
sprite_idle      = spr_pea_shooter_burrowed //burrowed
sprite_wandering = spr_pea_shooter
sprite_chasing   = spr_pea_shooter_angry_burrowed //burrowed
sprite_lost      = spr_basic_enemy_cooldown
sprite_attacking = spr_pea_shooter
sprite_cooldown  = spr_pea_shooter_burrowed //burrowed
sprite_death     = spr_basic_enemy_death
//unique sprites
sprite_run = spr_pea_shooter_burrowed //burrowed
//radi
vision_radius = 800
attack_radius = 350
chase_radius  = 500
//unique radi
run_radius = 300
close_radius = 200
//unique vars
shoot_cooldown = false
run_lock = false


state = new SnowState("idle")

state.add(
	"idle", {
		enter: function() { 
			sprite_index = sprite_idle 
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
			_speed = ENEMY_DEFAULT_SPEED
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
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)

state.add(
	"chasing", {
		enter: function() { 
			_speed = ENEMY_DEFAULT_SPEED
			sprite_index = sprite_chasing 
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
			show_debug_message("Apple")
			_speed = 0
			path_end()
			sprite_index = sprite_cooldown
			alarm[0] = 120
		}
	}
)
state.add(
	"run", {
		enter: function() {
			
			alarm[2] = 180
			run_lock = true
			sprite_index = sprite_run	
			//alarm[3] = 30
		} , 
			step: function () {
				var direction_to_player = point_direction(x, y, obj_player.x, obj_player.y)
				move_towards_point(x - lengthdir_x(2, direction_to_player), y - lengthdir_y(2, direction_to_player), _speed)
				if (distance_to_player > chase_radius) {return state.change("attack_cooldown")}
		}
	}
)


//burrowed = untargetable do this in player