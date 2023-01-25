function heal(amount) { _health = min(_health + amount, MAX_HEALTH) }
function damage(amount) { _health = max(_health - amount, MIN_HEALTH) }
function reset_health() { _health = MAX_HEALTH }

function do_movement(horizontal_input, vertical_input) {

	_move_dir = point_direction(0,0, horizontal_input, vertical_input);
		
	//Get x and y speed
	var _spd = 0;
	var _inputLevel = point_distance(0 ,0, horizontal_input, vertical_input);
	_inputLevel = clamp(_inputLevel, 0, 1);


	_spd = +_move_spd * _inputLevel;
	
	_xspd = lengthdir_x(_spd, _move_dir);
	_yspd = lengthdir_y(_spd, _move_dir);
		
	#region Collision
	if place_meeting(other.x + _xspd, other.y, obj_collision) {
		_xspd = 0;	
	}
	if place_meeting(other.x, y + _yspd, obj_collision) {
		_yspd = 0;	
	}
	#endregion
	//Move player
	x += _xspd;
	y += _yspd;
	
	#region Stamina
if _stamina >= 100
{
	_stamina = MAX_STAMINA
}
if _stamina < 1 
{
	_stamina_lock = 1;
	alarm[0] = 120;
}
if keyboard_check(vk_shift) && _stamina > 1 && _stamina_lock = 0
{
	_move_spd = 6;
	_stamina -= 1;
} else {
	_move_spd = 3;
	_stamina += 0.2;
}
#endregion
}

function melee_attack()
{
	centerY = other.y + centerYOffset;
	_aim_dir = point_direction(other.x, centerY, mouse_x, mouse_y);
}

function draw_my_weapon()
{
	var _depth = (_aim_dir > 0 && _aim_dir < 180);
	myGun.depth = depth + _depth;
	
	myGun.x = x + lengthdir_x(gun_dis, _aim_dir);
	myGun.y = y + lengthdir_y(gun_dis, _aim_dir);

	gun_dis = lerp(gun_dis, 11, 0.1);
	
	
	//get the weapon off the players body
	var _xOffset = lengthdir_x(weaponOffsetDist, _aim_dir);
	var _yOffset = lengthdir_y(weaponOffsetDist, _aim_dir);

	//flip weapon upright
	var _weaponYscl = 1;
	if _aim_dir > 90 && _aim_dir < 270
	{
		_weaponYscl = -1;	
	}		
}
 