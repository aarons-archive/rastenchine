event_inherited()

function Weapon(durability, attack_damage) : Item() constructor {
	MIN_DURABILITY = 0
	MAX_DURABILITY = durability
	_durability = MAX_DURABILITY
	
	_attack_damage = attack_damage
}