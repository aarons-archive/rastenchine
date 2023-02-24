
state = shambler_state.sleeping

idle_sprite = spr_shambler
death_sprite = spr_shambler_death

invincible = false
push = 1
_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

vision_radius = 500
attack_radius = 100
agro_radius = 300
agro = false

global._enemy_damage = 10
idle_movement = 0
_y = y
_x = x

path = path_add()
path_delay = 10
path_timer = irandom(60)
explode_timer = 0