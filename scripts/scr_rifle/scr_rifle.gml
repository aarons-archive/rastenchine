#macro RIFLE_BULLET_SPRITE      (spr_rifle_bullet)
#macro RIFLE_BULLET_SPREAD      (4)
#macro RIFLE_BULLET_SPEED       (10)
#macro RIFLE_BULLET_RANGE       (50)
#macro RIFLE_BULLET_DAMAGE      (10)
#macro RIFLE_BULLET_BURST_COUNT (3)

#macro RIFLE_KICKBACK_DISTANCE (3)

function Rifle() : Gun() constructor {
	////////////
	// sprite //
	////////////
	DEFAULT_SPRITE   = spr_rifle
	COOLDOWN_SPRITE  = spr_rifle_cooldown
	RELOADING_SPRITE = spr_rifle_reloading
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES       = FPS * 0.3
	BURST_COOLDOWN_FRAMES = FPS * 0.1
	RELOADING_FRAMES      = FPS * 1.2
	
	//////////
	// ammo //
	//////////
	DEFAULT_AMMO = 60
	DEFAULT_CLIP = 12
	ammo = DEFAULT_AMMO
	clip = DEFAULT_CLIP
	
	/////////////
	// special //
	/////////////
	burst_count = RIFLE_BULLET_BURST_COUNT
	
	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				if (burst_count >= 1) {
					var spread = point_direction(instance.x, instance.y, mouse_x, mouse_y) + random_range(-RIFLE_BULLET_SPREAD, RIFLE_BULLET_SPREAD)
					instance_create_layer(
						instance.x, instance.y,
						"player", obj_projectile, 
						{ 
							sprite_index: RIFLE_BULLET_SPRITE, 
							direction: spread, 
							image_angle: spread,
							speed: RIFLE_BULLET_SPEED, 
							range: RIFLE_BULLET_RANGE,
							damage: RIFLE_BULLET_DAMAGE,
						}
					)
					burst_count -= 1
					clip -= 1
					offset -= RIFLE_KICKBACK_DISTANCE
					state.change("burst_cooldown")
				}
				else {
					burst_count = RIFLE_BULLET_BURST_COUNT
					state.change("cooldown")
				}
			}
		}
	)
	state.add(
		"burst_cooldown", {
			enter: function() {
				instance.sprite_index = COOLDOWN_SPRITE
			},
			step: function() {
				if (state.get_time(false) >= BURST_COOLDOWN_FRAMES) {
					return state.change("idle") 
				}
			},
			leave: function() {
				instance.sprite_index = DEFAULT_SPRITE
			}
		}
	)
}