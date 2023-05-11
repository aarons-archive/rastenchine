#macro RAILGUN_BULLET_SPRITE (spr_railgun_beam)
#macro RAILGUN_BULLET_RANGE  (50)
#macro RAILGUN_BULLET_DAMAGE (5)

#macro RAILGUN_KICKBACK_DISTANCE (7.5)

function Railgun() : Gun() constructor {
	////////////
	// sprite //
	////////////
	DEFAULT_SPRITE   = spr_railgun
	COOLDOWN_SPRITE  = spr_railgun_cooldown
	RELOADING_SPRITE = spr_railgun_reloading
	
	////////////
	// timing //
	////////////
	COOLDOWN_FRAMES  = FPS * 0.4
	RELOADING_FRAMES = FPS * 1
	CHARGE_FRAMES    = FPS * 0.4
	
	//////////
	// ammo //
	//////////
	DEFAULT_AMMO = 40
	DEFAULT_CLIP = 1
	ammo         = DEFAULT_AMMO
	clip         = DEFAULT_CLIP
	
	////////////
	// states //
	////////////
	state.add(
		"shooting", {
			step: function() {
				if (state.get_time(false) >= CHARGE_FRAMES) {
					instance_create_layer(
						instance.x + lengthdir_x(13, obj_player._direction), instance.y + lengthdir_y(13, obj_player._direction), 
						"player", obj_railgun_beam, 
						{ 
							sprite_index: RAILGUN_BULLET_SPRITE, 
							direction: obj_player._direction, 
							image_angle: obj_player._direction,
							range: RAILGUN_BULLET_RANGE,
							damage: RAILGUN_BULLET_DAMAGE,
						}
					)
					clip -= 1
					offset -= RAILGUN_KICKBACK_DISTANCE
					state.change("cooldown")
				}
			}
		}
	)
}
