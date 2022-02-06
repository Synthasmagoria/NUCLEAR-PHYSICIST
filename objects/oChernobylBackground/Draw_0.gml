///@desc

shader_set(sh)
pass_uniforms()
shader_set_uniform_f(shader_get_uniform(sh, "wobble"), wobble_total)
draw_self()
shader_reset()