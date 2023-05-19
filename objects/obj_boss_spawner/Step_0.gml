if ((on_cooldown == false) && (instance_exists(obj_boss) == false)) {
	var chance = irandom_range(1, 100)
	if (chance <= 5) {
		var spawner = random_instance_of(obj_boss_spawn_zone)
		if (spawner == undefined) {
			exit
		}
		var spawn_x = irandom_range(spawner.bbox_left + (sprite_get_width(dev_boss) / 2), spawner.bbox_right - (sprite_get_width(dev_boss) / 2))
		var spawn_y = irandom_range(spawner.bbox_top + (sprite_get_height(dev_boss) / 2), spawner.bbox_bottom - + (sprite_get_height(dev_boss) / 2))
		instance_create_layer(spawn_x, spawn_y, "enemies", obj_boss)
		on_cooldown = true
		alarm[0] = 60
	}
}
