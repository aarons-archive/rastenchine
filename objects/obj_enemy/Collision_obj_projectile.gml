var item = obj_player.inventory.item
var tame = obj_tamed_shambler
var proj = other;

if (other.image_index == 1) {
	if (invincible == false) {
		_speed = 0
		path_end()
		invincible = true
		alarm[6] = 30
		
		//knockback
		var knockback = 8;
		var knock_dir = point_direction(x, y, other.x, other.y); 
		var knockback_x = lengthdir_x(knockback,  knock_dir);
		var knockback_y = lengthdir_y(knockback,  knock_dir); 
	    _x -= knockback_x;
		_y -= knockback_y; 
		
		if (item != Rifle) item.state = weapon_state.cooldown
		if instance_exists(obj_tamed_shambler){tame.state = shambler_tamed_state.agro}
		if instance_exists(obj_tamed_shambler){tame.target = self}
	}
}
