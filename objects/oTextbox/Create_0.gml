text = "Enter Chernobyl?"
text_cut = array_create(0)
text_margin = new vec2(24, 14)
text_char_index = 0
text_index = 0
text_number = 0
text_speed = 1 * global.fps_adjust
text_ysep = 0
text_lines = 3
text_offset = new vec2(8, 8)
text_width = 324
text_instant = false

sprite_index = textbox_get_sprite()

font = fDefault

t = 0;
t_incr = f2sec(1) * 0.03

reposition = function() { // depends on update_size
	draw_set_font(font)
	var
	cw = camera_get_view_width(view_camera[0]),
	ch = camera_get_view_height(view_camera[0])
	x = cw / 2 - sprite_width / 2
	
	if instance_exists(oPlayer) && oPlayer.y < ch / 2
		y = ch - text_offset.y - sprite_height
	else
		y = text_offset.y
}
update_size = function() {
	var size = textbox_get_size(font, text_width, text_margin, text_lines, text_ysep)
	set_width(size.x)
	set_height(size.y)
}
parse_text = function() {
	draw_set_font(font)
	var _line_length = floor(text_width / string_width("i")) - 2, _line_count = 0, _start = 0, _end = 0, _len = string_length(text), i = 0
	text_cut[0] = ""
	
	while (true) {
		_end += _line_length
		if _end > _len {
			_end = _len
			text_cut[i] += string_copy(text, _start + 1, _end - _start) + "\n"
			break
		}
		
		_end = string_last_pos_ext(" ", text, _end)
		
		if _start == _end { // word is longer than entire text box
			break
		}
			
		text_cut[i] += string_copy(text, _start + 1, _end - _start)
		_start = _end
		_line_count++
		
		if _line_count == text_lines {
			i++
			_line_count = 0
			text_cut[i] = ""
		} else {
			text_cut[i] += "\n"
		}
	}
	
	text_number = array_length(text_cut)
}