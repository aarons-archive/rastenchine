function BaseballBat() : Melee() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE           = spr_baseball_bat
	HAND_SPRITE      = spr_baseball_bat_hand
	CHARGING_SPRITE  = spr_baseball_bat_hand
	ATTACKING_SPRITE = spr_baseball_bat_hand
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES = 5
	ATTACK_FRAMES   = 20
	
	////////////
	// charge //
	////////////
	MIN_CHARGE       = 0
	MAX_CHARGE       = 5
	CHARGE_PER_FRAME = 0.1
	CHARGE_THRESHOLD = 2
	charge = MIN_CHARGE
	
	////////////
	// damage //
	////////////
	DEFAULT_DAMAGE = 2
	damage = DEFAULT_DAMAGE
}
