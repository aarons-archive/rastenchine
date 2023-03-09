event_inherited()

enum enemy_state {
	idle,
	wandering,
	agro,
	attacking,
	death,
	burrowed,
	charging,
	sleeping
}

state = enemy_state.idle

death_sprite = undefined
idle_sprite = undefined
wander_sprite = undefined
agro_sprite = undefined
attacking_sprite = undefined
push = 1

global._enemy_damage = 10
_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

agro = false
agro_timer = undefined

idle_movement = 0
_y = y
_x = x

path = path_add()
path_delay = 10
wander_delay = 360
path_timer = irandom(60)
