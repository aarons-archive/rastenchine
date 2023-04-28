if (instance_exists(obj_boss) == false) {
	var chance = irandom_range(1, 100)
	if (chance <= 100) {
		var spawner = random_instance_of(obj_boss_spawn_zone)
		alarm[0] = 60
	}
}
