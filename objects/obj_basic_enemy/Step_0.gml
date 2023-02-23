event_inherited()

enum basic_enem_state {
	idle,
	agro,
	attacking,
	death
}

switch (state) {
	case basic_enem_state.idle:
			sprite_index = idle_sprite
			alarm[3] = 120
			_speed = ENEMY_DEFAULT_SPEED
			if idle_movement = 0
			{
				x += _speed * irandom_range(-3, 3)
				y += _speed * irandom_range(-3, 3)
				idle_movement = 1
				alarm[1] = 60
			}
			if ((collision_circle(x, y, agro_radius, obj_player, false, false) && _health > 0) 
			|| agro == true && _health > 0) {state = shambler_state.agro} 
			break
	case basic_enem_state.agro:
		agro = true
		sprite_index = spr_shambler
		if (agro == true) {
			check_for_player()
			if (obj_player.x < x) {image_xscale = -1} else {image_xscale = 1} 
			if (collision_rectangle(x-64, y-34,x+64,y+34, obj_player, false, false) && _health > 0) {state = basic_enem_state.attacking	}
		}
		if (collision_circle(x, y, vision_radius, obj_player, false, false)
			&& !collision_circle(x, y, agro_radius, obj_player, false, false)) {state = basic_enem_state.idle }
		if (collision_circle(x, y,100, obj_player, false, false) && _health > 0) {state = basic_enem_state.agro}
		break
	case basic_enem_state.attacking:
		_speed = 0
		alarm[2] = 30
		sprite_index = spr_basic_enemy_attack
		if image_index >= 4 {state = basic_enem_state.agro}
		break
	case basic_enem_state.death:
		break
}