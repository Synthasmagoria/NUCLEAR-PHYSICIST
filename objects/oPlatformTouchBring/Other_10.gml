///@desc

if (!touched) {
	touched = true
	hspeed = hs * global.fps_adjust
	vspeed = vs * global.fps_adjust
	
	for (var i = array_length(instance) - 1; i >= 0; i--) {
		instance[i].hspeed = hspeed
		instance[i].vspeed = vspeed
	}
}