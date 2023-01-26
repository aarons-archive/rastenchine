
MIN_HEALTH = 0
MAX_HEALTH = 10
_health = MAX_HEALTH

WALK_SPEED = 3
RUN_SPEED = 6
ROLL_SPEED = 15
_speed = WALK_SPEED

MAX_STAMINA = 100
_stamina = MAX_STAMINA
alarm[0] = 60;
_stamina_lock = 0;

_x_movement = 0
_y_movement = 0
_roll_lock = 0;

//Weapon Stuff
_center_y_offset = -8;
_center_y = y + _center_y_offset;//set in step event
_aim_dir = 0;
_weap = instance_create_layer(x, y, "Instances_1", obj_weap);
_weap_dis = 50;

attack_cooldown = 0