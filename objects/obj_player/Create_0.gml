/*
MIN_HEALTH = 0
MAX_HEALTH = health_
_health = MAX_HEALTH
*/
//MAX_SPEED = speed_
//_speed = MAX_SPEED

MAX_STAMINA = 100
_stamina = MAX_STAMINA
timer = 60;
alarm[0] = 60;
_stamina_lock = 0;

_move_spd = 3;
_roll_spd = 7;

//Weapon Stuff
_center_y_offset = -8;
_center_y = y + _center_y_offset;//set in step event
_aim_dir = 0;
_weap = instance_create_layer(x, y, "Instances_1", obj_weap);
_weap_dis = 50;
