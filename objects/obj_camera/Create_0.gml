PAN_SCALE = 2
PAN_MAX = 150
pan_enabled = true

zoom = 1
ZOOM_MIN = 0.1
ZOOM_MAX = 7.5

SMOOTHING = 15

camera = view_camera[0]

default_view_width = camera_get_view_width(camera)
default_view_height = camera_get_view_height(camera)

follow = obj_player
x = obj_player.x
y = obj_player.y - PLAYER_ORIGIN_OFFSET