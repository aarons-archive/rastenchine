instances = []

state = new SnowState("spawn")
state.add(
	"spawn", {
		step: function() {
			// remove enemy instances that don't exist anymore
			instances = array_filter(
				instances,
				function(instance) { return (instance_exists(instance) == true) }
 			)
			// go into the cooldown state if:
			// - there are still enemy instances left from the previous spawn
			// - the player is within 200px of the spawners bounding box
			if (
				(array_length(instances) >= 1)
				or 
				(point_in_rectangle(
					obj_player._x, obj_player._y, 
					bbox_left - 200, bbox_top - 200, bbox_right + 200, bbox_bottom + 200
				) == true)
			) { 
				return state.change("cooldown") 
			}
			// create <spawn_count> random enemy instances and add
			// them to a list of instances created by this spawner
			repeat (spawn_count) { 
				array_push(
					instances, 
					instance_create_layer(
						random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), 
						"enemies", spawn_objects[irandom_range(0, array_length(spawn_objects) - 1)],
						{ 
							created_by_spawner: true,
							spawner_bbox_left: bbox_left, 
							spawner_bbox_top: bbox_top,
							spawner_bbox_right: bbox_right, 
							spawner_bbox_bottom: bbox_bottom
						}
					)
				)
			}
		}
	}
)
state.add(
	"cooldown", {
		step: function() {
			// wait for <cooldown_frames> frames to pass before
			// attempting to spawn more enemies
			if (state.get_time(false) >= cooldown_frames) {
				return state.change("spawn")
			}
		}
	}
)