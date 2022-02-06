///@desc

// Inherit the parent event
event_inherited();

sh = shChernobylRadiation
wobble = 0.0005
wobble_add = 0.001
wobble_total = 0
wobble_factor = 0
uranium_radius = 100
sprite_index = sChernobylBG01
follow = true

sound = audio_play_sound(sndGeigerCounter, 0, true)
audio_sound_gain(sound, 0, 0)
gpu_set_texrepeat(true)