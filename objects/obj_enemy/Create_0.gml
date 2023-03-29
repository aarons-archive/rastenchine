event_inherited()
randomize()


sprite_death = undefined
idle_sprite = undefined
wander_sprite = undefined
agro_sprite = undefined
attacking_sprite = undefined
push = 1

global._enemy_damage = 10
_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

vision_radius = 0
attack_radius = 0
chase_radius = 0

_y = y
_x = x

path = path_add()
path_delay = 10
wander_delay = 360
path_timer = irandom(60)
