#macro DEBUG          true
#macro LIGHTING_DEBUG false
#macro FPS            game_get_speed(gamespeed_fps) 

#region Entities

#region Player
// min/default/max values
#macro PLAYER_MAX_HEALTH  100
#macro PLAYER_MAX_STAMINA 100
// speed
#macro PLAYER_WALK_SPEED 4
#macro PLAYER_RUN_SPEED  7
#macro PLAYER_ROLL_SPEED 10
#endregion

#region Dummy
#macro DUMMY_MAX_HEALTH 100
#endregion

#region Enemy
#macro ENEMY_MAX_HEALTH    100
#macro ENEMY_DEFAULT_SPEED 4
#endregion

#endregion

#region Inventory

#region Crowbar
#macro CROWBAR_DAMAGE 2
// charge
#macro CROWBAR_MIN_CHARGE       0
#macro CROWBAR_CHARGE_THRESHOLD 2
#macro CROWBAR_CHARGE_PER_FRAME 0.1
#macro CROWBAR_MAX_CHARGE       4
// alarm frames
#macro CROWBAR_ATTACK_FRAMES   20
#macro CROWBAR_COOLDOWN_FRAMES 40
#endregion

#region Gun
#macro GUN_DAMAGE        5
#macro GUN_CLIP   6
#macro GUN_MAX_AMMO 10
#macro GUN_RELOAD_FRAMES FPS * 1
#macro GUN_COOLDOWN_FRAMES FPS * 0.4
#endregion

#endregion

#region UI

// camera view
#macro VIEW_WIDTH  camera_get_view_width(view_camera[0])
#macro VIEW_HEIGHT camera_get_view_height(view_camera[0])
#macro VIEW_MARGIN 10
// spacing
#macro UI_MARGIN   5
#macro UI_PADDING  5
#macro UI_ROUNDING 10
#macro UI_TUNING   2
// positions
#macro UI_X1 VIEW_MARGIN
#macro UI_Y1 VIEW_MARGIN
#macro UI_X2 VIEW_WIDTH - VIEW_MARGIN
#macro UI_Y2 VIEW_HEIGHT - VIEW_MARGIN
// colours
#macro UI_BG_COLOUR        #7F7F7F
#macro UI_BG_ACTIVE_COLOUR #A6A6A6
#macro UI_FG_COLOR         #000000

#endregion