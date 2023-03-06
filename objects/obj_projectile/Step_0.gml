if (image_index >= 6) { instance_destroy() }
speed = lerp(speed, 0, 0.05);
if (speed < 0.5) instance_destroy();