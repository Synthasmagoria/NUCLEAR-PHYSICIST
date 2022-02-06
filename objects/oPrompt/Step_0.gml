
if input_check_pressed("down") || input_check_pressed("up") {
	sfx_play_sound(select_sound)
	option_index = wrap(
		option_index + input_check_pressed("down") - input_check_pressed("up"),
		0,
		array_length(option) - 1)
}

resize()

arrow.x = x + margin.x + arrow_offset.x
arrow.y = y + margin.y + (option_height + option_ysep) * option_index + + arrow_offset.y

if input_check_pressed("jump") {
	action[option_index]()
} else if input_check_pressed("shoot") {
	back_action()
}

if !instance_exists(oPlayer) {
	instance_destroy()
}