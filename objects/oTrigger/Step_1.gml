///@desc Trigger

if (place_meeting(x, y, oPlayer)) {
	
	trigger(trg)
	
	if (trg_snd != -1) {
		sfx_play_sound(trg_snd)
	}
	
	if (destroy) {
		instance_destroy()
		
		with object_index
			if trg == other.trg
				instance_destroy()
	}
}