var xx = random_range(obj_enemy_spawner.bbox_left, obj_enemy_spawner.bbox_right);
var yy = random_range(obj_enemy_spawner.bbox_top, obj_enemy_spawner.bbox_bottom);

var _count = max_enemies 

show_debug_message(enemies_spawned)

for (var i = 0; i < _count; i++) {
	if (enemies_spawned[i] == undefined) {
		_count -= 1
		array_delete(enemies_spawned, i, 1)
	}
}

if !collision_rectangle(obj_player.x - 300,obj_player.y - 200,obj_player.x + 200, obj_player.y + 300,	obj_enemy_spawner, true, false) && spawn_cooldown == false {
	repeat _count { 
		array_push(enemies_spawned, instance_create_layer(xx, yy, "other", obj_basic_enemy))
	}
	spawn_cooldown = true
}
	
// create 3 enemies
// if those 3 enemies die spawn 3 more