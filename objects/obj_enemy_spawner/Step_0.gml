for (var i = 0; i < array_length(enemies_spawned); i++) {
	if (!instance_exists(enemies_spawned[i])) {
		array_delete(enemies_spawned, i, 1)
	}
}

if array_length(enemies_spawned) == 0 and (!collision_rectangle(obj_player.x - 300,obj_player.y - 200,obj_player.x +
	200, obj_player.y + 300, obj_enemy_spawner, true, false)) && spawn_cooldown == false {
	repeat max_spawns { 
		enemies = choose(obj_basic_enemy,obj_pea_shooter,obj_shambler,obj_leaper)
		array_push(
			enemies_spawned, 
			instance_create_layer(
				random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), 
				"other", enemies,
				{origin_x: x, origin_y: y}
			)
		)
	}
	
	spawn_cooldown = true
	alarm[0] = 120
}