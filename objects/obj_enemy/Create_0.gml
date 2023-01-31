//are we chasing player
alert = false;
//distance to start chasing player
alert_dis = 160;
//set distance stop to attack player
attack_dis = 18;
//create path stuff
path = path_add();
//speed chase player
move_spd = 2;
//set delay for calculating path
calc_path_delay = 30;
//set a timer fro when we calc a path
calc_path_timer = irandom(60);
