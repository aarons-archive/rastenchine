if (selected && obj_player.select_input)
{
	if (point_in_circle(obj_player.x,obj_player.y,x,y,256)) && (!instance_exists(obj_Dialog))
	{
		//stop player controlling or whatever
		with (instance_create_layer(x,y,layer,obj_Dialog))
		{
			dialog_init();
			for (var i = 0; i < array_length(other.dialogs); i++) {
			    dialog_add(other.dialogs[i][0], other.dialogs[i][1]);
			}
			dialog_reset();
		}

		with (obj_camera)
		{
			follow = other.id;	
			ENABLE_PANNING = false;
		}
	}
}

if (distance_to_object(obj_player) > 100) && (instance_exists(obj_Dialog))
{
	instance_destroy(obj_Dialog);	
	with (obj_camera)
		{
			follow = obj_player;
			ENABLE_PANNING = true;
		}
}
