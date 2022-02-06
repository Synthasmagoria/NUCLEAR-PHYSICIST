///@desc Spawn cluster

repeat(amount) {
	var sx = x, sy = y, inst = -1
	if place_free(x, y) {
		inst = instance_create_layer(x, y, layer, object)
	} else {
		var try_index = 0, try_max = 4, 
		do {
			sx = x + irandom_range(-sprite_width / 2, sprite_width / 2)
			sy = y + irandom_range(-sprite_height / 2, sprite_height / 2)
			try_index++
			if (place_free(sx, sy)) {
				inst = instance_create_layer(sx, sy, layer, object)
				break
			}
		} until (try_index > try_max)
	}
	
	if inst == -1
		continue
	
	inst.image_xscale = size
	inst.image_yscale = size
	inst.speed = velocity
	inst.direction = irandom(359)
	
	instance_destroy(other)
}

instance_destroy()