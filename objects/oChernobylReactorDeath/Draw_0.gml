
shader_set(sh)
shader_set_uniform_f(shader_get_uniform(sh, "factor"), factor)
draw_self()
shader_reset()