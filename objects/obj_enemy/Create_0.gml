event_inherited()

enum enemy_state {
	idle,
	agro,
	attacking,
	burrowed,
	charging,
	sleeping
}

death_sprite = undefined
idle_sprite = undefined
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
path_timer = irandom(60)
