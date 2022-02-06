font = fDefault
margin = new vec2(24, 14)

draw_set_font(font)
option = ["Proceed", "Info", "Back"]
option_index = 0
option_height = string_height("W")
option_ysep = 0

sprite_index = textbox_get_sprite()

arrow = instance_create_depth(x, y, depth - 1, oSelectionArrow)
arrow.image_xscale = 1
arrow.image_yscale = 1
arrow_offset = new vec2(-1, 2)
arrow_get_width = function() {
	return abs(arrow.sprite_width)
}

resize = function() {
	var size = textbox_get_size(font, array_find_max_string_width(option) + arrow_get_width(), margin, array_length(option), option_ysep)
	set_width(size.x)
	set_height(size.y)
}

back_sound = sndPromptBack
accept_sound = sndChangeFloor
select_sound = sndPromptSelect

action = array_create(array_length(option))
back_action = function() {}