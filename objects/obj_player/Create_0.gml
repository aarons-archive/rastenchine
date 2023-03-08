event_inherited()

x_input = 0
y_input = 0
walk_input = false
run_input = false
dodge_input = false

enum player_movement_state {
	idle,
	walking,
	running,
	dodging,
	exhausted,
}
movement_state = player_movement_state.idle
stamina = PLAYER_MAX_STAMINA
_speed = PLAYER_WALK_SPEED

_health = PLAYER_MAX_HEALTH
inventory = new Inventory()

// make everything dark
global.ambientShadowIntensity = 0.2

// spawn light instances
instance_create_layer(x, y, "Player", obj_flash_light)
instance_create_layer(x, y, "Player", obj_area_light)
