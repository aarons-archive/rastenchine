if (invincible == false) && (other.state == enemy_state.attacking) {	
	invincible = true
	alarm[6] = 30
	_health -= global._enemy_damage
}