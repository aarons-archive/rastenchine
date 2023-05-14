event_inherited()

audio_listener_orientation(0,1,0,0,0,1)
x_input = 0
y_input = 0
walk_input = false
run_input = false
dodge_input = false

_x = -1
_y = -1
_direction = -1

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

instance_create_layer(x, y - PLAYER_ORIGIN_OFFSET, "player", obj_flash_light)
instance_create_layer(x, y - PLAYER_ORIGIN_OFFSET, "player", obj_area_light)
