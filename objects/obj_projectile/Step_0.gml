if (image_index >= 6) { instance_destroy() }
if (image_index == 1) image_speed = 0;
lifetime--;
if (lifetime <= 0) speed = lerp(speed, 0, 0.1);
if (speed <= 2) image_speed = 1;