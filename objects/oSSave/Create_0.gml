// Inherit the parent event
event_inherited();

sprite_index = sChernobylSave

save = function() {
	animation_counter = animation_length
	savedata_save_player()
	sfx_play_sound(sndChernobylSave)
}

save_check = function() {
	return place_meeting(x, y, oPlayer) && input_check_pressed("skip")
}