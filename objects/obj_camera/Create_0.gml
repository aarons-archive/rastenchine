CAMERA = view_camera[0]
HALF_VIEW_WIDTH = camera_get_view_width(CAMERA) * 0.5
HALF_VIEW_HEIGHT = camera_get_view_height(CAMERA) * 0.5
ENABLE_PANNING = true

follow = obj_player

x = follow.x;
y = follow.y;

to_x = xstart
to_y = ystart

PAN_MAX = 150
PAN_SCALE = 3
pan = 0
