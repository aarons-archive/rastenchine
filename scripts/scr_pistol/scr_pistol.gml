#macro PISTOL_BULLET_SPRITE (spr_pistol_bullet)
#macro PISTOL_BULLET_SPEED  (10)
#macro PISTOL_BULLET_RANGE  (50)
#macro PISTOL_BULLET_DAMAGE (5)
#macro PISTOL_BULLET_SPREAD (2.5)

#macro PISTOL_KICKBACK_DISTANCE (7.5)

function Pistol() : Gun() constructor {
	////////////
	// sprite //
	////////////
	DEFAULT_SPRITE   = spr_pistol
	COOLDOWN_SPRITE  = spr_pistol_cooldown
	RELOADING_SPRITE = spr_pistol_reloading
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	
	//////////
	// ammo //
	//////////
	DEFAULT_AMMO = 60
	DEFAULT_CLIP = 6
	ammo         = DEFAULT_AMMO
	clip         = DEFAULT_CLIP

	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				var spread = point_direction(instance.x, instance.y, mouse_x, mouse_y) + random_range(-PISTOL_BULLET_SPREAD, PISTOL_BULLET_SPREAD)
				instance_create_layer(
					instance.x, instance.y, "player", obj_projectile, 
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
				offset -= PISTOL_KICKBACK_DISTANCE
				state.change("cooldown")
			}
		}
	)
}