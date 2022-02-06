
fade_length = 1
text_delay = 1
music_delay = 1.75
fade_delay = 4
stop_delay = 0.5

text_inst = -1
warp_room = rBlank

var fade = instance_create_layer(0, 0, layer, oFade)
fade.fade(fade_length, false, true)

alarm[0] = sec2f(fade_length)