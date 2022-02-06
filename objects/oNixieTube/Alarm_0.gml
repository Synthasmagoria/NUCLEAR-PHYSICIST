

if !audio_is_playing(sndReactorLamps)
    sfx_play_sound(sndReactorLamps)

transition_to_digit(queued)
alarm[0] = -1
queued = noone