// Health
MAX_HEALTH = 100
MIN_HEALTH = 0
_health = MAX_HEALTH
_healing_pack = 4
_heal_counter = 0
_heal_cooldown = false
_iframes = 0

// Stamina
MAX_STAMINA = 100
_stamina = MAX_STAMINA
_stamina_lock = false

// Movement
WALK_SPEED = 5
RUN_SPEED = 10
ROLL_SPEED = 6
_speed = WALK_SPEED

// Movement Calculation
_direction = 0
_x_movement = 0
_y_movement = 0
_is_rolling = false

// Lighting
global.ambientShadowIntensity = 1

flash_light = light_create_spot(x, y, 64000, $FFFFFFFF, 1000, 2, 30, 0)
light_add_to_world(flash_light)

point_light = light_create_point(x, y, 64000, $FFFFFFFF, 250, 2)
light_add_to_world(point_light)

// Weapon
_weapon = instance_create_layer(x, y, "instances", obj_crowbar)
_center_y_offset = -8;
_center_y = y + _center_y_offset;
_aim_dir = 0;
_weap_dis = 50;
_attack_cooldown = 0
_damage = 5
global._attack_damage = 0
_attack_charger = 0
_melee_activate = 1
_range_activate = 0