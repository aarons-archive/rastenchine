event_inherited()

// scr_get_inputs
x_input = 0
y_input = 0
walk_input = false
run_input = false
dodge_input = false

// scr_handle_movement_state
enum player_movement_state {
	idle,
	walking,
	running,
	dodging,
	exhausted,
}
movement_state = player_movement_state.idle

_direction = 0
_health = PLAYER_HEALTH
_speed = PLAYER_WALK_SPEED
stamina = PLAYER_MAX_STAMINA
inventory = new Inventory()

// make everything dark
global.ambientShadowIntensity = 0.95

// spawn light instances
instance_create_layer(x, y, "Player", obj_flash_light)
instance_create_layer(x, y, "Player", obj_area_light)
