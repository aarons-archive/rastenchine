if !instance_exists(obj_boss) && (global.time > 0 /*200*/ || global.time < 40) {
	spawn_boss = irandom_range(1, 100)
	if spawn_boss <= 5 {
		instance_create_layer(obj_player.x,obj_player.y,"enemies", obj_boss)
	}
}

alarm[0] = 60