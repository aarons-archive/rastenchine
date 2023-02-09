// State
_state = player_states.idle

// Health
MAX_HEALTH = 100
MIN_HEALTH = 0
_health = MAX_HEALTH
_healing_pack = 4
_heal_counter = 0
_heal_cooldown = false
_iframes = 0

// Stamina
MAX_STAMINA = 150
_stamina = MAX_STAMINA
_stamina_lock = false

// Movement
WALK_SPEED = 5
RUN_SPEED = 7
ROLL_SPEED = 8
_speed = WALK_SPEED

// Movement Calculation
_horizontal_input = 0
_vertical_input = 0
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

room_light = undefined

// Inventory
_inventory = new Inventory()
