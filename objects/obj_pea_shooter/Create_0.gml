event_inherited()		
//sprites
sprite_idle      = spr_pea_shooter_burrowed //burrowed
sprite_wandering = spr_pea_shooter
sprite_chasing   = spr_pea_shooter_burrowed_angry //burrowed
sprite_lost      = dev_basic_enemy_cooldown
sprite_attacking = spr_pea_shooter
sprite_cooldown  = spr_pea_shooter_burrowed //burrowed
sprite_death     = dev_basic_enemy_cooldown
sprite_hurt      = spr_pea_shooter
//unique sprites
sprite_run = spr_pea_shooter_burrowed //burrowed
//radi
vision_radius = 600
attack_radius = 350
chase_radius  = 400
//unique radi
run_radius = 200
close_radius = 150
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
			_speed = 0
			path_end()
			sprite_index = sprite_cooldown
			alarm[0] = 30
		}
	}
)
state.add(
	"run", {
		enter: function() {
			show_debug_message("AOGKASKOG")
			alarm[2] = 180
			run_lock = true
			sprite_index = sprite_run	
			alarm[3] = 30
		} , 
		step: function () {
			var run_dir = point_direction(x,y, obj_player.x, obj_player.y)
			var x_dir = lengthdir_x(5, run_dir)
			var y_dir = lengthdir_y(5, run_dir)
			
			if (place_meeting(x + x_dir, y, obj_player_collision)) {
				while (not place_meeting(x + sign(x_dir), y, obj_player_collision)) {
					x += sign(x_dir)
				}
				x_dir = 0
			}
			if (place_meeting(x, y + y_dir, obj_player_collision)) {
				while (not place_meeting(x, y + sign(y_dir), obj_player_collision)) {
					y += sign(y_dir)
				}
				y_dir = 0
			}
				
			x -= x_dir
			y -= y_dir
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
//burrowed = untargetable do this in player