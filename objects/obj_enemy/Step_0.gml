//if ((place_meeting(x, y, obj_flash_light) == true) or (place_meeting(x, y, obj_area_light) == true)) {
//	visible = true
//} 
//else {
//	visible = false
//}

if (_health < 1) { 
	state = enemy_state.death
}

#region death case
switch (state) {
	case enemy_state.death:
		path_end()
		_speed = 0
		sprite_index = death_sprite
		break
}
#endregion

if instance_exists(obj_railgun_projectile) {
	if (collision_line(obj_player.x,obj_player.y,obj_railgun_projectile.r[1],obj_railgun_projectile.r[2],self,0,0)) {
		var item = obj_player.inventory.item
		var tame = obj_tamed_shambler
		if (invincible == false) {
			invincible = true
			alarm[6] = 30
			_health -= item.damage
			item.state = weapon_state.cooldown
			if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
			if instance_exists(obj_tamed_shambler){tame.target = self}
		}
	}
}

