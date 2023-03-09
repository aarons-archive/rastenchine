// health
#macro PLAYER_MIN_HEALTH (0)
#macro PLAYER_MAX_HEALTH (100)

// stamina 
#macro PLAYER_MIN_STAMINA (0)
#macro PLAYER_MAX_STAMINA (100)

// idle
#macro PLAYER_IDLE_SPEED                  (0)
#macro PLAYER_IDLE_STAMINA_GAIN_PER_FRAME (0.75)

// walking
#macro PLAYER_WALK_SPEED                  (4)
#macro PLAYER_WALK_STAMINA_GAIN_PER_FRAME (0.5)

// running
#macro PLAYER_RUN_SPEED                  (7)
#macro PLAYER_RUN_STAMINA_COST_PER_FRAME (1)

// dodging
#macro PLAYER_DODGE_SPEED        (10)
#macro PLAYER_DODGE_STAMINA_COST (20)
#macro PLAYER_DODGE_FRAMES       (FPS / 1.2)  // 30 frames

// exhausted
#macro PLAYER_EXHAUSTED_SPEED                  (2)
#macro PLAYER_EXHAUSTED_STAMINA_GAIN_PER_FRAME (0.25)
#macro PLAYER_EXHAUSTED_THRESHOLD              (PLAYER_MAX_STAMINA * 0.3)  // 30%
