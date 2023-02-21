event_inherited()

#region Lighting
global.ambientShadowIntensity = 0.9
flash_light = instance_create_layer(x, y, "Player", obj_flash_light)
area_light = instance_create_layer(x, y, "Player", obj_area_light)
room_light = undefined
#endregion

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
xy_direction = 0
x_movement = 0
y_movement = 0

visibility_cone = instance_create_layer(x, y, "Player", obj_visibility_cone)