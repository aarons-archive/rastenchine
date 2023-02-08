function Crowbar() : Weapon() constructor {
	
	_sprite = spr_crowbar
	
	static attack = function() { 
		if _attack_charger >= 10 {
			_attack_charger = 10
		}
		if (mouse_check_button(mb_left) && _attack_cooldown = 0) {
			_instance.sprite_index = spr_crowbar_charge_attack
			_attack_charger += 0.1
		} 
		if (mouse_check_button_released(mb_left) && _attack_charger > 1) {
			_instance.sprite_index = spr_crowbar_attack
			_attack_cooldown = 1
			obj_player.alarm[2] = 30
			global._attack_damage = _attack_charger * _damage + _damage
		} 
		if (mouse_check_button_pressed(mb_left) && _attack_cooldown = 0 && _attack_charger < 1) {
			_attack_cooldown = 1
			obj_player.alarm[2] = 30
			_instance.sprite_index = spr_crowbar_attack
		} 
	}
}