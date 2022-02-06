other.velocity.y = -spring_power
other.sprung = true

sfx_play_sound(sndSpring)

image_speed = 1
image_index = 1

//if other.vspeed < 0 && other.yprevious > bbox_bottom {
//	other.vspeed = spring_power
//	audio_play_sound(sndSpringInverted, false, 0)
//} else {
//	other.vspeed = -spring_power
//	audio_play_sound(sndSpring, false, 0)
//}

