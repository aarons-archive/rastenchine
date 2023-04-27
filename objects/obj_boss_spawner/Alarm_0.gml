/*
if !instance_exists(obj_boss) && (global.time > 0 200 || global.time < 40) {
	spawn_boss = irandom_range(1, 100)
	if spawn_boss <= 5 {
		
		instance_create_layer(obj_player.x,obj_player.y,"enemies", obj_boss)
	}
}
alarm[0] = 60


if !place_meeting(x,y,obj_player_collision) && !place_meeting(x,y,obj_lighting_collision) 
	
if (distance_to_point(obj_player.x ,obj_player.y) <= 600) && (distance_to_point(obj_player.x ,obj_player.y) >= 300)
	{
		show_debug_message("POGGERS!")
		instance_create_layer(obj_player.x,obj_player.y,"enemies", obj_boss)
	} else (show_debug_message("FUCk"))
	
	
//generates point off screen if point must be within certain boundaries and if colliding 
//with either a wall or a light it regens the point
//spawn off player screen
//spawn not in buildings
*/

randomise()

if (instance_exists(obj_boss) == false) /*check time as well*/ {
	var chance = irandom_range(1, 100)
	if (true) {
		while (true) {
			spawn_x = irandom_range(0, room_width)
			spawn_y = irandom_range(0, room_height)
			with (obj_boss) { if (place_meeting(spawn_x, spawn_y, obj_anti_boss)) { continue }}
			else if (point_distance(spawn_x, spawn_y, obj_player.x, obj_player.y) <= 750) { continue }
			instance_create_layer(spawn_x, spawn_y, "enemies", obj_boss)
			show_debug_message("spawned")
			break
		}
	}
}
