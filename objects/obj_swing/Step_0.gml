lifetime--
if (image_index == 2) image_speed = 0;
if (lifetime <= 0) {
	//image_alpha -= 0.1
	image_speed = 1;
}
if (image_index == 5) instance_destroy()