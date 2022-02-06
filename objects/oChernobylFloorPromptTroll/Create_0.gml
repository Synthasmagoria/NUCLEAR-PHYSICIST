///@desc

event_inherited()

option_index = 1

action[1] = function() {
	instance_destroy()
	sfx_play_sound(select_sound)
	textbox_create(TEXT_DB.CHERNOBYL_INFO_TROLL)
}