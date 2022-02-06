///@desc				Gets music to be played in a room
///@func				bgm_get_room_music(room)
///@arg 				room
function bgm_get_room_music(r) {
	switch (r) {
		case rChernobylOutside:
		case rChernobylClear:
			return musChernobylOutside;
			break;
		case rChernobyl01:
			return musRussianSkymbience
			break
		case rChernobyl02:
		case rChernobylSecret:
		case rChernobyl05:
		case rChernobyl06:
		case rChernobyl14:
			return musChernobyl
			break
		case rChernobyl03:
		case rChernobyl04:
			return musChernobylExploration
			break
		case rChernobyl07:
		case rChernobyl08:
		case rChernobyl09:
		case rChernobyl10:
		case rChernobyl11:
		case rChernobyl12:
		case rChernobyl13:
			return musDeepChernobyl
			break
		case rChernobylBoss:
			return musReactor
			break
		case rBlank:
			return -2
			break
		default:	
			return -1
			break
	}
}

///@desc	Get pitch of the music to be played in a room
///@func	bgm_get_room_music_pitch(room)
///@arg		room
function bgm_get_room_music_pitch(r) {
	switch (r) {
		case rChernobyl10:
		case rChernobyl11:
			return 0.9
			break
		case rChernobyl08:
			return 0.8
			break
		case rChernobyl13:
		case rChernobylClear:
			return 0.6
			break
		case rChernobyl09:
		case rChernobylOutside:
			return 0.4
			break
		default:
			return 1.0
			break
	}
}

///@desc	Get gain of the music to be played in a room
///@func	bgm_get_room_music_gain(room)
///@arg		room
function bgm_get_room_music_gain(r) {
	switch (r) {
		case rChernobyl10:
			return 0.5
			break
		default:
			return 1.0
			break
	}
}