follow = obj_player

pan_scale = 2
pan_max = 150

camera = view_camera[0]

view_width = camera_get_view_width(camera)
half_view_width = view_width / 2

view_height = camera_get_view_height(camera)
half_view_height = view_height / 2

x = obj_player.x
y = obj_player.y - PLAYER_ORIGIN_OFFSET