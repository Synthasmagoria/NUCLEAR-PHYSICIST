///@desc

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(font)

if selected {
	animation += animation_speed
	
	if animation >= 1 {
		animation_phase = (animation_phase + 1) % animation_phase_number
		animation = 0
	}
	
	switch animation_phase {
		case 0: image_xscale = -1 * (animation * 2 - 1) break
		case 1: image_yscale = -1 * (animation * 2 - 1) break
		case 2: image_xscale = animation * 2 - 1 break
		case 3: image_yscale = animation * 2 - 1 break
	}
	
	draw_text_transformed(x, y, text, image_xscale, image_yscale, image_angle)
} else {
	draw_text_transformed_color(x, y, text, image_xscale * 0.9, image_yscale * 0.9, image_angle, c_gray, c_gray, c_gray, c_gray, image_alpha)
}

draw_set_defaults()