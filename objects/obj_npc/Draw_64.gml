if (jumpscare) {
	jumpscale += 0.05
	audio_play_sound(snd_what,1,0)
	draw_sprite_ext(spr_npc_head,0,100,-100,jumpscale,jumpscale,0,c_white,1)
	if jumpscale > 4 jumpscale = 4
}