/// @description play idle sounds
if !(state.get_current_state() == "attacking") || !(state.get_current_state() == "hurt")
	|| !(state.get_current_state() == "death")
{
	var chance = irandom_range(1, 100)
	if (chance <= 25) {
		audio_play_sound_on(s_emit,idle_sounds,false,1,global.enemy_audio)
	}
}
alarm[9] = 120