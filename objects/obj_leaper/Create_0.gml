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
//idle sounds
idle_sounds  = choose(snd_leaper_idle_one,snd_leaper_idle_two,snd_leaper_idle_three)
moving_sound = snd_molten_moving //snd_leaper_moving
hurt_sound   = snd_molten_hurt //snd_leaper_hurt
death_sound  = snd_leaper_death
attack_sound = snd_leaper_attack
//State Machine

state = new SnowState("idle")
state.add(
	"idle", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
ALL_THE_STATES()
state.add(
	"wandering", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"wandering_cooldown", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"lost", {
		step: function() {
			if (within_attack_radius) { return state.change("charging") }
		}
	}
)
state.add(
	"chasing", {
		step: function() {
			enemy_chasing(true)
		}
	}
)
state.add(
	"charging", {
		enter: function() {
			if (obj_player._x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_charging
			attack_x = obj_player.x
			attack_y = obj_player.y
			path_end()
			alarm[1] = 45
		}
	}
)
state.add(
	"attacking", {
		enter: function() {
			if (obj_player._x < x) {image_xscale = -1} else {image_xscale = 1}
			sprite_index = sprite_attacking
			move_towards_point(attack_x, attack_y, 10)
			audio_play_sound(snd_leaper_attack,1,false,global.enemy_audio)
		},
		step: function() {
			if (place_meeting(x, y, obj_player) || place_meeting(x, y, obj_player_collision) || distance_to_point(attack_x, attack_y) <= 10) {
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
