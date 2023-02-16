event_inherited()

_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

_vision_radius = 500
_attack_radius = 100
_agro_radius = 300
_agro = false

global._enemy_damage = 10
_idle_movement = 0
_y = y
_x = x

path = path_add()
_path_delay = 10
_path_timer = irandom(60)