enum TEXT_DB {
	CHERNOBYL_ENTER,
	CHERNOBYL_NEXT_FLOOR,
	CHERNOBYL_INFO,
	CHERNOBYL_INFO_GERMAN,
	CHERNOBYL_INFO_2,
	CHERNOBYL_INFO_TROLL,
	CHERNOBYL_OUTSIDE,
	PENIS2_AUTHORS_NOTE,
	__MAX
}

function textbox_get_size(font, width, margin, lines, ysep) {
	draw_set_font(font)
	return new vec2(
		width + margin.x * 2,
		string_height("W") * lines + ysep * 2 + margin.y * 2)
}

function textbox_get_string(str_ind) {
	var str = "<undefined textbox string>";
	switch (str_ind) {
		case TEXT_DB.CHERNOBYL_ENTER:
			str = "Enter Chernobyl?"
			break;
		case TEXT_DB.CHERNOBYL_NEXT_FLOOR:
			str = "Go to the next floor?"
			break;
		case TEXT_DB.CHERNOBYL_INFO:
			str = "The stairs lead to the next floor. Reach the last floor to clear the dungeon."
			break;
		case TEXT_DB.CHERNOBYL_INFO_GERMAN:
			str = "Die Treppe führt zur nächsten Ebene. Erreichst du die letzte Ebene, hast du den Deungeon gemeistert."
			break;
		case TEXT_DB.CHERNOBYL_INFO_TROLL:
			str = "Zoink!"
			break;
		case TEXT_DB.CHERNOBYL_OUTSIDE:
			str = "Re-enter Chernobyl?"
			break;
		case TEXT_DB.PENIS2_AUTHORS_NOTE:
			str = "Hi, I'm IdiotSavant77"
			break;
		default:
			str = "<Invalid index>"
			break;
	}
	return str;
}

function textbox_get_sprite() {
	switch (SUBGAME.PENIS2) {
		//case SUBGAME.PENIS2:
		//	return sP2UI
		default:
			return sPMDTextboxPurple
	}
}

function textbox_create(str_ind) {
	var textbox = instance_create_layer(0, 0, layer, oTextbox)
	textbox.text = textbox_get_string(str_ind);
	textbox.text_lines = 3
	textbox.text_width = 324
	textbox.update_size()
	textbox.reposition()
	textbox.parse_text()
	return textbox;
}

function textbox_create_string(str) {
	var textbox = instance_create_layer(0, 0, layer, oTextbox)
	textbox.text = str
	textbox.text_lines = 3
	textbox.text_width = 324
	textbox.update_size()
	textbox.reposition()
	textbox.parse_text()
	return textbox;
}

///@func prompt_create(str_ind, [option_index])
///@arg {index} str_ind
///@arg {index} [option_index]
function prompt_create(str_ind, object) {
	
	var pos = new vec2(32, 32)
	var off = 16
	
	var textbox = instance_create_layer(pos.x, pos.y, layer, oTextbox)
	textbox.text = textbox_get_string(str_ind)
	textbox.text_lines = 3
	textbox.text_width = 256
	textbox.update_size()
	textbox.parse_text()
	
	return instance_create_layer(pos.x + textbox.sprite_width + off, pos.y, layer, object)
}

function textbox_create_string_based(xx, yy, str_ind) {
	
}