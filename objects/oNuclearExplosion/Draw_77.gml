
switch (phase) {
    case 0:
        draw_self()
        break

    case 1:
        gpu_set_blendmode(bm_add)
        draw_self()
        gpu_set_blendmode(bm_normal)
        
        shader_set(sh)
        shader_set_uniform_f(shader_get_uniform(sh, "time"), sqr(time / length[phase]))
        shader_set_uniform_f(shader_get_uniform(sh, "resolution"), surface_get_width(application_surface), surface_get_height(application_surface))
        
        var _pos = application_get_position()
        draw_surface_stretched(application_surface, _pos[0], _pos[1], _pos[2] - _pos[0], _pos[3] - _pos[1])
        
        shader_reset()
        break
    
    case 2:
        gpu_set_blendmode(bm_add)
        draw_self()
        gpu_set_blendmode(bm_normal)
        break
}
