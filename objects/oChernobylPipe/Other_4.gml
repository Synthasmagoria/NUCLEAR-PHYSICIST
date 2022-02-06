///@desc

if bottomless {
	block_create(x, y, sprite_width, block_size * image_yscale)
	sprite_index = sChernobylPipeBGBottomless
} else if topless {
	block_create(x, y + sprite_height - block_size * image_yscale, sprite_width, block_size * image_yscale)
	sprite_index = sChernobylPipeBGTopless
} else if less {
	sprite_index = sChernobylPipeBG
} else {
	block_create(x, y, sprite_width, block_size * image_yscale)
	block_create(x, y + sprite_height - block_size * image_yscale, sprite_width, block_size * image_yscale)
}