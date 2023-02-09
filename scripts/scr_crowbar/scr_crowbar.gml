function Crowbar() : Weapon() constructor {
	
	_sprite = spr_crowbar
	
	DAMAGE = 5
	_damage = DAMAGE
	_cooldown = false
	_charge = 0
	
	static alarm_one = function() {
		_instance.sprite_index = spr_crowbar
		_damage = DAMAGE
		_cooldown = false
	}
	
	static attack = function() { 
		_charge = min(_charge, 10)

		if (mouse_check_button(mb_left) && _cooldown == false) {
			_instance.sprite_index = spr_crowbar_charge_attack
			_charge += 0.1
		} 
		if (mouse_check_button_released(mb_left) && _charge > 1) {
			_instance.sprite_index = spr_crowbar_attack
			_damage = DAMAGE + (_charge * DAMAGE)
			_cooldown = true
			alarm[1] = 30
			
		} 
		if (mouse_check_button_pressed(mb_left) && _cooldown = false && _charge < 1) {
			_cooldown = true
			alarm[1] = 30
			_instance.sprite_index = spr_crowbar_attack
		} 
	}
}