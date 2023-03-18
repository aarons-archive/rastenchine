event_inherited()

within_attack_radius = (collision_circle(x, y, attack_radius, obj_player, true, false) != noone)
within_chase_radius = (collision_circle(x, y, chase_radius, obj_player, true, false) != noone)
within_vision_radius = (collision_circle(x, y, vision_radius, obj_player, true, false) != noone)

state.step()
