event_inherited();
within_charge_attack_radius = (collision_circle(x, y, charge_attack_radius, obj_player, true, false) != noone)
within_swipe_attack_radius = (collision_circle(x, y, swipe_attack_radius, obj_player, true, false) != noone)

if _health <= 20 && state.get_current_state() != "Run"
{
	state.change("Run")
	show_debug_message("BLASaaaaaa")
}