///@desc

if instance_exists(oPlayer) {
	player_set_stopped(true)
	oPlayer.sprite_index = sPlayerBackNuclear
	x = oPlayer.x
	y = oPlayer.y - 16
	oPlayer.animate = false
}

sounds = [
	sndChernobylCrafting01,
	sndChernobylCrafting02,
	sndChernobylCrafting03,
	sndChernobylCrafting04,
	sndChernobylCrafting05,
	sndChernobylCrafting06,
	sndChernobylCrafting07,
	sndChernobylCrafting08,
	sndChernobylCrafting09,
	sndChernobylCrafting10,
	sndChernobylCrafting11,
	sndChernobylCrafting12]
sound_volume = 1.0
sound_rate = 0.1 * global.fps_adjust
sound_cooldown = 0

time = 0
length = 4