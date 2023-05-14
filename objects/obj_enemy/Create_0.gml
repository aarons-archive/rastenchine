#macro ENEMY_MAX_HEALTH     (20)
#macro ENEMY_DEFAULT_SPEED  (4)

event_inherited()
randomize()
//all sprites
sprite_idle      = undefined
sprite_wandering = undefined
sprite_chasing   = undefined
sprite_lost      = undefined
sprite_attacking = undefined
sprite_cooldown  = undefined
sprite_death     = undefined
//enemy clutter var
push = 1
//enemies stats var
global._enemy_damage = 10
_health = ENEMY_MAX_HEALTH
_speed = ENEMY_DEFAULT_SPEED
//radi
vision_radius = 0
attack_radius = 0
chase_radius  = 0
within_attack_radius = false
within_chase_radius  = false
within_vision_radius = false
within_charge_attack_radius = false
within_swipe_attack_radius  = false
//path vars
path = path_add()
path_delay = 10
wander_delay = 360
path_timer = irandom(60)
path_cooldown = 10
//wander var
wander_x = 0
wander_y = 0
//
_y = y
_x = x
//sounds
s_emit = audio_emitter_create()
audio_max_dis = 1000
audio_drop_out = 100

audio_falloff_set_model(audio_falloff_linear_distance)

audio_emitter_falloff(s_emit,audio_drop_out,audio_max_dis,1)

state = 0

