///@desc Initialize variables

image_speed = 0

animation_counter = 0
animation_length = 90 / global.fps_adjust

sprite_index = sSave

save = function() {
	animation_counter = animation_length
	savedata_save_player()
}

save_check = function() {
	return instance_exists(oPlayer) &&
		(place_meeting(x, y, oWeaponProjectile) || (place_meeting(x, y, oPlayer) && input_check("shoot")))
}