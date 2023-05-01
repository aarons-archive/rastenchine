#macro GUI_MARGIN  (6)
#macro GUI_PADDING (6)

#macro GUI_BG_SPRITE (spr_gui_background)
#macro GUI_BG_OFFSET (variable_struct_get(sprite_get_nineslice(GUI_BG_SPRITE), "left"))

#macro GUI_X1       (0 + GUI_MARGIN)
#macro GUI_X2       (VIEW_WIDTH - GUI_MARGIN)
#macro GUI_MIDDLE_X (VIEW_WIDTH / 2)
#macro GUI_WIDTH    (VIEW_WIDTH)

#macro GUI_Y1       (0 + GUI_MARGIN) 
#macro GUI_Y2       (VIEW_HEIGHT - GUI_MARGIN)
#macro GUI_MIDDLE_Y (VIEW_HEIGHT / 2)
#macro GUI_HEIGHT   (VIEW_HEIGHT)
