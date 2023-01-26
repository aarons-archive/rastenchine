
MAX_STAMINA = 100
_stamina = MAX_STAMINA
_stamina_lock = false

WALK_SPEED = 5
RUN_SPEED = 10
ROLL_SPEED = 15
_speed = WALK_SPEED

_direction = 0
_x_movement = 0
_y_movement = 0
_is_rolling = false

_center_y_offset = -8;
_center_y = y + _center_y_offset;
_aim_dir = 0;
_weap = instance_create_layer(x, y, "Instances_1", obj_weap);
_weap_dis = 50;

attack_cooldown = 0