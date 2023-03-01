enum peashooter_state {
	idle,
	burrowed,
	agro,
	attacking,
	death,
}

switch(state){
	case peashooter_state.idle:
		sprite_index = spr_pea_shooter
		break
	case peashooter_state.agro:
		break
	case peashooter_state.attacking:
		_speed = 0
		sprite_index = spr_pea_shooter
		var _direction = point_direction(x, y, mouse_x, mouse_y)
		instance_create_layer(
			x, y, 
			"other", 
			obj_pea_bullets, 
			{ speed: 10, direction: _direction, image_angle: _direction }
		)
		break
}