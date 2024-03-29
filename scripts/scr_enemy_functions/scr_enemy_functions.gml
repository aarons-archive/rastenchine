 function enemy_hurt()
{
	sprite_index = sprite_hurt
	path_end()
	alarm[0] = 30
}
function enemy_knockback()
{
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
//enemies find a spot within a vicinity and if it is able to be moved to the enemy will move that way
function enemy_wandering()
{
	randomize()
	sprite_index = sprite_wandering
	if (created_by_spawner == true) {
		wander_x = irandom_range(spawner_bbox_left - 100, spawner_bbox_right + 100)
		wander_y = irandom_range(spawner_bbox_top - 100, spawner_bbox_bottom + 100)
	}
	else {
		wander_x = irandom_range(bbox_left - 200, bbox_right + 200)
		wander_y = irandom_range(bbox_top - 200, bbox_bottom + 200)
	}
	var path_found = mp_grid_path(global.mp_grid, path, x, y, wander_x, wander_y, irandom_range(0, 1))
	if (path_found) { 
		if (wander_x < x) {image_xscale = -1} else {image_xscale = 1}
		path_start(path, 2, path_action_stop, false)
	}
}
function enemy_wandering_cooldown()
{
	sprite_index = sprite_cooldown
	alarm[0] = 120
	audio_stop_all()
}
function enemy_chasing(charger=false)
{
	if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1}
		if (within_attack_radius) { return state.change(charger ? "charging" : "attacking") }
		if (!within_chase_radius) { return state.change("lost") }
		path_cooldown -= 1
		if (path_cooldown <= 0) {
			path_cooldown = 20
			var path_found = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, true)
			if (path_found) { path_start(path, _speed, path_action_stop, false) }
	}
}
function enemy_lost()
{
	sprite_index = sprite_lost 
	alarm[0] = 120
}
function enemy_death()
{
	path_end()
	_speed = 0
	sprite_index = sprite_death
	if image_index >= sprite_get_number(sprite_death) - 1 {instance_destroy() }
}

function enemy_peashooter_run()
{
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

function ALL_THE_STATES()
{
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
			enemy_wandering()
			if audio_is_playing(moving_sound) {audio_stop_sound(moving_sound)}
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
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
			enemy_wandering_cooldown()
			audio_stop_sound(moving_sound)
		},
		step: function() {
			if (within_chase_radius) { return state.change("chasing") }
		}
	}
)
state.add(
	"lost", {
		enter: function() { 
			enemy_lost()
			audio_stop_sound(moving_sound)
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
			if audio_is_playing(moving_sound) {audio_stop_sound(moving_sound)}
			audio_play_sound_on(s_emit,moving_sound,true,1,global.enemy_audio)
		},
		step: function() {
			enemy_chasing()
		}
	}
)
if state.add(
	"death", {
		enter: function() {
			audio_stop_sound(moving_sound)
			audio_play_sound_on(s_emit,death_sound,false,1,global.enemy_audio)
			enemy_death()
		}
	}	
)
state.add(
	"hurt", {
		enter: function() {
			enemy_hurt()
			audio_stop_sound(moving_sound)
			audio_play_sound_on(s_emit,hurt_sound,false,1,global.enemy_audio)
		},
		step: function() {
			enemy_knockback()
			}	
			
		}
)
}
global.enemy_audio = 0.03