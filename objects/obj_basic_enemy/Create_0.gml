event_inherited()

state = basic_enem_state.idle

_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED

vision_radius = 500
attack_radius = 100
agro_radius = 300
agro = false
global._enemy_damage = 10

idle_sprite = spr_basic_enemy
death_sprite = spr_basic_enemy_death
