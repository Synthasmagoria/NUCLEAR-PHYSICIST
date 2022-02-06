///@desc
shader_set(sh)
pass_uniforms()
shader_set_uniform_f(shader_get_uniform(sh, "wobble"), wobble_total)
draw_self()
draw_sprite_ext(
	sprite_index, (image_index + 1) % image_number,
	x, y, image_xscale, image_yscale, image_angle, image_blend, frac(image_index))
shader_reset()