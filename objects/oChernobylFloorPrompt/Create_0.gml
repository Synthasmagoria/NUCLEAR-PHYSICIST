///@desc

event_inherited()

back_action = function() {
	instance_destroy()
	player_set_frozen(false)
	sfx_play_sound(back_sound)
}
action[0] = function() {
	var _warp = instance_create_layer(0, 0, layer, oPMDTransitionWarp)
	with (oPMDStairs) _warp.warp_room = warp_room
	sfx_play_sound(accept_sound)
	player_set_stopped(true)
	instance_destroy()
}
action[1] = function() {
	instance_destroy()
	sfx_play_sound(select_sound)
	textbox_create(TEXT_DB.CHERNOBYL_INFO)
}
action[2] = back_action