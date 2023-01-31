state = STATES.chasing;

HP_MAX = 100;
_hp = HP_MAX;
_invincible = 0;
//ATACKING
attack_radius = 200;
attack_rate = room_speed * 0.5;
attack_is_possible = true;
//Moving
_y = y;
_x = x;
// used to find player
target = noone;