#macro SHOTGUN_BULLET_SPRITE (spr_shotgun_shell)
#macro SHOTGUN_BULLET_SPEED  (10)
#macro SHOTGUN_BULLET_RANGE  (50)
#macro SHOTGUN_BULLET_DAMAGE (5)

#macro SHOTGUN_KICKBACK_DISTANCE (7.5)

function Shotgun() : Gun() constructor {
	/////////////
	// sprites //
	/////////////
	SPRITE           = spr_shotgun
	HAND_SPRITE      = spr_shotgun_hand
	COOLDOWN_SPRITE  = spr_shotgun_hand
	RELOADING_SPRITE = spr_shotgun_hand
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	
	//////////
	// ammo //
	//////////
	MAX_AMMO = 60
	MAX_CLIP = 2
	ammo = MAX_AMMO
	clip = MAX_CLIP

	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				var spread = angle - 10
				repeat (4) {
					instance_create_layer(
						instance.x + lengthdir_x(10, angle), instance.y + lengthdir_y(10, angle), 
						"player", obj_projectile, 
						{ 
							sprite_index: SHOTGUN_BULLET_SPRITE, 
							direction: spread, 
							image_angle: spread,
							speed: SHOTGUN_BULLET_SPEED, 
							range: SHOTGUN_BULLET_RANGE,
							damage: SHOTGUN_BULLET_DAMAGE,
						}
					)
					spread += irandom_range(5, 10)
				}
				clip -= 1
				distance -= SHOTGUN_KICKBACK_DISTANCE
				return state.change("cooldown")
			}
		}
	)
}
