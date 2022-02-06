if bgm_get_room_music(warp_room) != bgm_get_room_music(room)
	bgm_stop_music()
room_goto(rBlank)
instance_destroy(oPlayer)
alarm[0] = -1
alarm[1] = sec2f(text_delay)
alarm[2] = sec2f(music_delay)
alarm[3] = sec2f(fade_delay)