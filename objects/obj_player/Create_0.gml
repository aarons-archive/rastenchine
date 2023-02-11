enum player_states {
	idle,
	moving,
	rolling,
}

state = player_states.idle
inventory = new Inventory()

#region Health
MIN_HEALTH = 0
MAX_HEALTH = 100
_health = MAX_HEALTH
_healing_pack = 4
_heal_counter = 0
_heal_cooldown = false
_iframes = 0

#region Stamina
MAX_STAMINA = 150
_stamina = MAX_STAMINA
_stamina_lock = false
#region

#region Speed
WALK_SPEED = 5
RUN_SPEED = 7
ROLL_SPEED = 15
_speed = WALK_SPEED
#endregion

#region Movement
horizontal_input = 0
vertical_input = 0
_direction = 0
_x_movement = 0
_y_movement = 0
_is_rolling = false
#endregion

#region Lighting
global.ambientShadowIntensity = 1
room_light = undefined
point_light = light_create_point(x, y, 32000, $FFFFFFFF, 250, 2)
flash_light = light_create_spot(x, y, 32000, $FFFFFFFF, 1000, 2, 20, 0)
light_add_to_world(point_light)
light_add_to_world(flash_light)
#endregion

