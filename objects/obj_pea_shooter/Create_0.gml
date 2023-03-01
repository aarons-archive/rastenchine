event_inherited()

state = peashooter_state.idle

_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

vision_radius = 700
attack_radius = 300
agro_radius = 500
agro = false
global._enemy_damage = 10


//unique vars
close_radius = 200
shoot_cooldown = false

idle_sprite = spr_pea_shooter_burrowed
death_sprite = spr_basic_enemy_death