event_inherited()

enum player_states {
	idle,
	moving,
	rolling,
}

state = player_states.idle
inventory = new Inventory()

_health = PLAYER_MAX_HEALTH

stamina = PLAYER_MAX_STAMINA
stamina_lock = false

_speed = PLAYER_WALK_SPEED
x_input = 0
y_input = 0
_direction = 0
x_movement = 0
y_movement = 0

#region Lighting
global.ambientShadowIntensity = 1
area_light = light_create_point(x, y, 32000, $FFFFFFFF, 250, 2)
light_add_to_world(area_light)
flash_light = light_create_spot(x, y, 32000, $FFFFFFFF, 1000, 2, 20, 0)
light_add_to_world(flash_light)
room_light = undefined
#endregion


