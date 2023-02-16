if (DEBUG == true) {
	if (keyboard_check_pressed(global.DAMAGE_DUMMY_KEY)) {
		_health -= 10
	}
	if (keyboard_check_pressed(global.HEAL_DUMMY_KEY)) {
		_health += 10
	} 
}