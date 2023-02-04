#macro VIEW_WIDTH  camera_get_view_width(view_camera[0])
#macro VIEW_HEIGHT camera_get_view_height(view_camera[0])
#macro VIEW_MARGIN 20
 
#macro UI_X1 VIEW_MARGIN
#macro UI_Y1 VIEW_MARGIN
#macro UI_X2 VIEW_WIDTH - VIEW_MARGIN
#macro UI_Y2 VIEW_HEIGHT - VIEW_MARGIN

#macro UI_ELEMENT_PADDING 5
#macro UI_ELEMENT_MARGIN  5

#macro UI_DEFAULT_BG_COLOUR #7F7F7F
#macro UI_ACTIVE_BG_COLOUR  #A6A6A6
#macro UI_FG_COLOR          #000000

#region Health Bar
#macro HEALTH_BAR_SPRITE  spr_heart
#macro HEALTH_BAR_SCALE   10
#macro HEALTH_BAR_WIDTH   sprite_get_width(HEALTH_BAR_SPRITE) * HEALTH_BAR_SCALE
#macro HEALTH_BAR_HEIGHT  sprite_get_height(HEALTH_BAR_SPRITE) 

#macro HEALTH_BAR_BG_X1 UI_X2 - HEALTH_BAR_WIDTH - (UI_ELEMENT_PADDING * 2)
#macro HEALTH_BAR_BG_Y1 UI_Y1
#macro HEALTH_BAR_BG_X2 UI_X2 
#macro HEALTH_BAR_BG_Y2 HEALTH_BAR_BG_Y1 + HEALTH_BAR_HEIGHT + (UI_ELEMENT_PADDING * 2)

#macro HEALTH_BAR_FG_X HEALTH_BAR_BG_X1 + UI_ELEMENT_PADDING
#macro HEALTH_BAR_FG_Y HEALTH_BAR_BG_Y1 + UI_ELEMENT_PADDING
#endregion

#region Stamina Bar
#macro STAMINA_BAR_WIDTH  HEALTH_BAR_WIDTH * 0.8
#macro STAMINA_BAR_HEIGHT HEALTH_BAR_HEIGHT * 0.8

#macro STAMINA_BAR_BG_X1 UI_X2 - STAMINA_BAR_WIDTH - (UI_ELEMENT_PADDING * 2)
#macro STAMINA_BAR_BG_Y1 HEALTH_BAR_BG_Y2 + ELEMENT_MARGIN
#macro STAMINA_BAR_BG_X2 UI_X2
#macro STAMINA_BAR_BG_Y2 STAMINA_BAR_BG_Y1 + STAMINA_BAR_HEIGHT + (UI_ELEMENT_PADDING * 2)

#macro STAMINA_BAR_FG_X1 STAMINA_BAR_BG_X1 + UI_ELEMENT_PADDING
#macro STAMINA_BAR_FG_Y1 STAMINA_BAR_BG_Y1 + UI_ELEMENT_PADDING
#macro STAMINA_BAR_FG_X2 STAMINA_BAR_BG_X2 - UI_ELEMENT_PADDING
#macro STAMINA_BAR_FG_Y2 STAMINA_BAR_BG_Y2 - UI_ELEMENT_PADDING
#endregion

#region Menu
#macro MENU_START_X 20
#macro PAGE_START_Y 20
#macro SUB_PAGE_START_Y 100
#macro ELEMENT_PADDING 20
#macro ELEMENT_MARGIN 5
#macro ELEMENT_HEIGHT string_height("HEIGHT") + ELEMENT_PADDING
#macro ELEMENT_FONT_TUNING 2
#endregion