if (
	other.state.get_current_state() == "attacking" 
	and 
	other.image_index > (sprite_get_number(other.sprite_index) - 2)
	and
	invincible == false
) {
	invincible = true
	alarm[6] = 30
	_health -= global._enemy_damage
}