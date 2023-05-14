#macro RAILGUN_BULLET_SPRITE (spr_railgun_beam)
#macro RAILGUN_BULLET_RANGE  (50)
#macro RAILGUN_BULLET_DAMAGE (20)

#macro RAILGUN_KICKBACK_DISTANCE (7.5)

function Railgun() : Gun() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE           = spr_railgun
	HAND_SPRITE      = spr_railgun_hand
	COOLDOWN_SPRITE  = spr_railgun
	RELOADING_SPRITE = spr_railgun
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	CHARGE_FRAMES    = FPS * 0.4
	
	//////////
	// ammo //
	//////////
	MAX_AMMO = 60
	MAX_CLIP = 1
	ammo = MAX_AMMO
	clip = MAX_CLIP
	
	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				if (state.get_time(false) >= CHARGE_FRAMES) {
					instance_create_layer(
						instance.x + lengthdir_x(12, angle), instance.y + lengthdir_y(12, angle), 
						"player", obj_railgun_beam, 
						{ 
							sprite_index: RAILGUN_BULLET_SPRITE, 
							direction: angle, 
							image_angle: angle,
							range: RAILGUN_BULLET_RANGE,
							damage: RAILGUN_BULLET_DAMAGE,
						}
					)
					clip -= 1
					distance -= RAILGUN_KICKBACK_DISTANCE
					return state.change("cooldown")
				}
			}
		}
	)
}
