
draw_self()

if text_instant
	text_char_index = string_length(text_cut[text_index])
else
	text_char_index = min(text_char_index + text_speed, string_length(text_cut[text_index]))

draw_set_font(font)
draw_text_outline(x + text_margin.x, y + text_margin.y, string_copy(text_cut[text_index], 0, text_char_index), $467F5F, sin(t) * 2)