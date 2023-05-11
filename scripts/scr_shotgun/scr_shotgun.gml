#macro SHOTGUN_BULLET_SPRITE (spr_shotgun_shell)
#macro SHOTGUN_BULLET_SPEED  (10)
#macro SHOTGUN_BULLET_RANGE  (50)
#macro SHOTGUN_BULLET_DAMAGE (5)

#macro SHOTGUN_KICKBACK_DISTANCE (7.5)

function Shotgun() : Gun() constructor {
	////////////
	// sprite //
	////////////
	DEFAULT_SPRITE   = spr_shotgun
	COOLDOWN_SPRITE  = spr_shotgun_cooldown
	RELOADING_SPRITE = spr_shotgun_reloading
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	
	//////////
	// ammo //
	//////////
	DEFAULT_AMMO = 40
	DEFAULT_CLIP = 2
	ammo         = DEFAULT_AMMO
	clip         = DEFAULT_CLIP

	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				var spread = point_direction(instance.x, instance.y, mouse_x, mouse_y) - 10
				repeat (4) {
					instance_create_layer(
						instance.x, instance.y, "player", obj_projectile, 
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
				offset -= SHOTGUN_KICKBACK_DISTANCE
				state.change("cooldown")
			}
		}
	)
}
