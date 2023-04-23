light = undefined

active = false
activated_by = undefined

connected_rooms = ds_list_create()
connected_room_count = collision_rectangle_list(
	bbox_left - 1, bbox_top - 1,
	bbox_right + 1, bbox_bottom + 1,  
	obj_room_collision, true, true,
	connected_rooms, false
)

middle_x = bbox_right - (sprite_width / 2)
middle_y = bbox_bottom - (sprite_height / 2)