var xx = random_range(obj_enemy_spawner.bbox_left, obj_enemy_spawner.bbox_right);
var yy = random_range(obj_enemy_spawner.bbox_top, obj_enemy_spawner.bbox_bottom);


if instance_number(obj_basic_enemy) < 1 && spawn_cooldown == false {
	if !collision_rectangle(obj_player.x - 300,obj_player.y - 200,obj_player.x + 200, obj_player.y + 300, obj_enemy_spawner, true, false)
	{
		instance_create_layer(xx,yy,"other",obj_basic_enemy)
		spawn_cooldown = true
		alarm[0] = 120
	}
}