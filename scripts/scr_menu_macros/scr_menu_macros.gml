#macro MENU_MARGIN (9)

#macro MENU_X1 (0 + MENU_MARGIN)
#macro MENU_Y1 (0 + MENU_MARGIN) 
#macro MENU_X2 (camera_get_view_width(view_camera[0]) - MENU_MARGIN)
#macro MENU_Y2 (camera_get_view_height(view_camera[0]) - MENU_MARGIN)

#macro MENU_X_MIDDLE (MENU_X2 / 2)
#macro MENU_Y_MIDDLE (MENU_Y2 / 2)

#macro MENU_ELEMENT_MARGIN  (9)
#macro MENU_ELEMENT_PADDING (9)

#macro MENU_ELEMENT_HEIGHT ((MENU_ELEMENT_PADDING * 2) + string_height("HEIGHT"))
