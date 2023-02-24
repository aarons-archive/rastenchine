enum weapon_state {
	idle,
	charging,
	attacking,
	cooldown,
	shooting,
	reloading
}

function Weapon() : Item() constructor {
	
	// common
	state = weapon_state.idle
	
	// overridden in subclasses (Crowbar, Gun, ...)
	damage = undefined
}