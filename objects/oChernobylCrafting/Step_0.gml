///@desc

sound_cooldown -= f2sec(1)
time += f2sec(1)

while sound_cooldown < 0 {
	sound_cooldown += sound_rate
	var s = sfx_play_sound(sounds[irandom(array_length(sounds)-1)])
}

if time > length
	instance_destroy()