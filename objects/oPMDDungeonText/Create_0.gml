
surf = -1
font = fPMDFloor

text_name = "Chernobyl"
text_name_yoffset = -96
text_floor = "B_F"
text_floor_replace = "_"
text_floor_index = 1

time = 0

fade_length = 0
fade = function(sec) {
    fade_length = sec2f(sec)
    alarm[0] = fade_length
}

room_get_floor_index = function(r) {
    switch (r) {
		case rChernobyl14:
			return 1
			break
        case rChernobyl02:
		case rChernobylSecret:
            return 2
            break
        case rChernobyl05:
            return 3
            break
        case rChernobyl06:
            return 4
            break
		case rChernobyl03:
			return 5
			break
		case rChernobyl07:
			return 6
			break
		case rChernobyl10:
			return 7
			break
		case rChernobyl08:
			return 8
			break
		case rChernobyl13:
			return 9
			break
		case rChernobyl09:
			return 10
			break
    }
}