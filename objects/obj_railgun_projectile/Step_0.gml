if (image_index >= 2 && image_speed = 1) image_index = 2;
else if (image_index <= 0 && image_speed = -1) instance_destroy();
lifetime--;
if (lifetime < 0) image_speed = -1;

distance = lerp(distance,maxdistance,0.5);
