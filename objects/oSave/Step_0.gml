///@desc Save

animation_counter = max(animation_counter - 1, 0)

if save_check() {
	save()
}

image_index = sign(animation_counter)