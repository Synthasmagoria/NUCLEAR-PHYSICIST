if input_check_pressed("jump") {
	if text_index < text_number - 1 {
		text_index++
		text_char_index = 0
	} else {
		instance_destroy()
		player_set_frozen(false)
	}
}

t += t_incr;