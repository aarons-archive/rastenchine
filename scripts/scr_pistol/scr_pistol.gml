#macro PISTOL_BULLET_SPRITE (spr_pistol_bullet)
#macro PISTOL_BULLET_SPEED  (10)
#macro PISTOL_BULLET_RANGE  (50)
#macro PISTOL_BULLET_DAMAGE (5)
#macro PISTOL_BULLET_SPREAD (2.5)

#macro PISTOL_KICKBACK_DISTANCE (7.5)

function Pistol() : Gun() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE           = spr_pistol
	HAND_SPRITE      = spr_pistol_hand
	COOLDOWN_SPRITE  = spr_pistol_hand
	RELOADING_SPRITE = spr_pistol_hand

	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	
	//////////
	// ammo //
	//////////
	MAX_AMMO = 60
	MAX_CLIP = 6
	ammo = MAX_AMMO
	clip = MAX_CLIP

	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				var spread = angle + random_range(-PISTOL_BULLET_SPREAD, PISTOL_BULLET_SPREAD)
				instance_create_layer(
					instance.x + lengthdir_x(10, angle), instance.y + lengthdir_y(10, angle), 
					"player", obj_projectile, 
					{ 
						sprite_index: PISTOL_BULLET_SPRITE, 
						direction: spread, 
						image_angle: spread,
						speed: PISTOL_BULLET_SPEED, 
						range: PISTOL_BULLET_RANGE,
						damage: PISTOL_BULLET_DAMAGE,
					}
				)
				clip -= 1
				distance -= PISTOL_KICKBACK_DISTANCE
				return state.change("cooldown")
			}
		}
	)
}