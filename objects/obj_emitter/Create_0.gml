s_emit = audio_emitter_create()
audio_max_dis = 1000
audio_drop_out = 100

audio_falloff_set_model(audio_falloff_linear_distance)
audio_emitter_position(s_emit,x,y,0)
audio_emitter_falloff(s_emit,audio_drop_out,audio_max_dis,1)

state = 0

