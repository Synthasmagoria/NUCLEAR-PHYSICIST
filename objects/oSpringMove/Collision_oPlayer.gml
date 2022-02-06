///@desc

// Inherit the parent event
event_inherited();

if !touched {
	touched = true
	hspeed = hs * global.fps_adjust
	vspeed = vs * global.fps_adjust
}