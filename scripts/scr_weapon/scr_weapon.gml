enum weapon_state {
	idle,
	charging,
	attacking,
	cooldown,
	shooting,
	reloading,
	special
}

function Weapon() : Item() constructor {
	
	// common
	state = weapon_state.idle
	
	// must be overridden in subclasses
	damage = undefined
}