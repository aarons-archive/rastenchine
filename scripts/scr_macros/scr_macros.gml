#macro DEBUG true
#macro FPS   game_get_speed(gamespeed_fps) 

#region Entities

#region Player
// min/default/max values
#macro PLAYER_MAX_HEALTH  100
#macro PLAYER_MAX_STAMINA 100
// speed
#macro PLAYER_WALK_SPEED 5
#macro PLAYER_RUN_SPEED  10
#macro PLAYER_ROLL_SPEED 15
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
#macro CROWBAR_CHARGE_DAMAGE    3
// alarm frames
#macro CROWBAR_ATTACK_FRAMES   20
#macro CROWBAR_COOLDOWN_FRAMES 40
#endregion

#region Gun
#macro GUN_DAMAGE        5
#macro GUN_MAX_BULLETS   5
#macro GUN_RELOAD_FRAMES FPS * 2
#endregion

#endregion

#region UI

#region Common
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

#region Health Bar
// sizes
#macro HEALTH_BAR_SPRITE spr_heart
#macro HEALTH_BAR_SCALE  10
#macro HEALTH_BAR_WIDTH  sprite_get_width(HEALTH_BAR_SPRITE) * HEALTH_BAR_SCALE
#macro HEALTH_BAR_HEIGHT sprite_get_height(HEALTH_BAR_SPRITE)
//bar background
#macro HEALTH_BAR_BG_X1  UI_X2 - HEALTH_BAR_WIDTH - (UI_PADDING * 2) + UI_TUNING
#macro HEALTH_BAR_BG_Y1  UI_Y1 - UI_TUNING
#macro HEALTH_BAR_BG_X2  UI_X2 
#macro HEALTH_BAR_BG_Y2  HEALTH_BAR_BG_Y1 + HEALTH_BAR_HEIGHT + (UI_PADDING * 2) - UI_TUNING
#macro HEALTH_BAR_MIDDLE HEALTH_BAR_BG_Y1 + (HEALTH_BAR_HEIGHT / 2) + UI_PADDING - UI_TUNING
// bar sprite
#macro HEALTH_BAR_X HEALTH_BAR_BG_X1 + UI_PADDING
#macro HEALTH_BAR_Y HEALTH_BAR_BG_Y1 + UI_PADDING
#endregion

#region Stamina Bar
// sizes
#macro STAMINA_BAR_SCALE  0.85
#macro STAMINA_BAR_WIDTH  HEALTH_BAR_WIDTH * STAMINA_BAR_SCALE
#macro STAMINA_BAR_HEIGHT HEALTH_BAR_HEIGHT * STAMINA_BAR_SCALE
// bar background
#macro STAMINA_BAR_BG_X1  UI_X2 - STAMINA_BAR_WIDTH - (UI_PADDING * 2)
#macro STAMINA_BAR_BG_Y1  HEALTH_BAR_BG_Y2 + UI_MARGIN
#macro STAMINA_BAR_BG_X2  UI_X2
#macro STAMINA_BAR_BG_Y2  STAMINA_BAR_BG_Y1 + STAMINA_BAR_HEIGHT + (UI_PADDING * 2)
#macro STAMINA_BAR_MIDDLE STAMINA_BAR_BG_Y1 + (STAMINA_BAR_HEIGHT / 2) + UI_PADDING
// bar foreground
#macro STAMINA_BAR_FG_X1 STAMINA_BAR_BG_X1 + UI_PADDING
#macro STAMINA_BAR_FG_Y1 STAMINA_BAR_BG_Y1 + UI_PADDING
#macro STAMINA_BAR_FG_X2 STAMINA_BAR_BG_X2 - UI_PADDING
#macro STAMINA_BAR_FG_Y2 STAMINA_BAR_BG_Y2 - UI_PADDING
#endregion

#region Menu
// spacing
#macro MENU_ELEMENT_MARGIN  5
#macro MENU_ELEMENT_PADDING 15
// sizes
#macro MENU_ELEMENT_HEIGHT string_height("HEIGHT") + MENU_ELEMENT_PADDING
// positions
#macro MENU_X          UI_X1
#macro MENU_PAGE_Y     UI_Y1
#macro MENU_SUB_PAGE_Y (MENU_PAGE_Y + MENU_ELEMENT_HEIGHT + MENU_ELEMENT_MARGIN) * 1.2 
#endregion

#endregion