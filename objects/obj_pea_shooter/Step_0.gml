event_inherited()
distance_to_player = distance_to_object(obj_player)

if (state.get_current_state() == "attacking") || (state.get_current_state() == "attack_cooldown")
{
	attack_radius = 400
} else { attack_radius = 250}
	