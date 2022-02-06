
if phase == 0 || phase == 1 {
    if !surface_exists(surf_1) {
        surf_1 = surface_create(surf_size.x, surf_size.y)
    }
    
    if !surface_exists(surf_2) {
        surf_2 = surface_create(surf_size.x, surf_size.y)
    }
}

time += time_incr

if length[phase] != -1 && time >= length[phase] {
    switch phase {
        case 0:
            grab = true
            sfx_play_sound(sndChernobylMenuExplosion)
            break
        case 1:
            var _s = swap ? surf_2 : surf_1
            spr_bg = sprite_create_from_surface(_s, 0, 0, surf_size.x, surf_size.y, false, false, 0, 0)
            with oChernobylMenuMaker
                visible = true
            surface_free(surf_1)
            surface_free(surf_2)
            with oChernobylMenuText
                auto = false
            break
        case 2:
            instance_create_layer(120, 400, layer, oChernobylMenu)
            music_id = audio_play_sound(music, 0, false)
            break
        case 3:
            sfx_play_sound(sndChernobylMenuGlitch)
            audio_sound_gain(music_id, 0.5, 0)
            with oChernobylMenuMaker image_yscale = -1
            break
        case 4:
            subgame_restart()
            break
    }
    
    phase_advance()
}

if grab {
    if sprite_exists(spr_grab)
        sprite_delete(spr_grab)
    
    var _surf_grab = surface_create_clear_alpha(surf_size.x, surf_size.y, c_black, 0.0)
    surface_set_target(_surf_grab)
    
    with oChernobylMenuGlow
        draw()
    
    with oChernobylMenuNuclear
        draw()
    
    surface_reset_target()
    
    spr_grab = sprite_create_from_surface(
        _surf_grab, 0, 0, surf_size.x, surf_size.y, false, false, 0, 0)
    
    instance_destroy(oChernobylMenuNuclear)
    instance_destroy(oChernobylMenuGlow)
    
    surface_set_target(surf_1)
    draw_sprite(spr_grab, 0, 0, 0)
    surface_reset_target()
    
    grab = false
}

switch phase {
    case 1:
        var _diff_surf, _draw_surf
        
        if !swap {
            _diff_surf = surf_1
            _draw_surf = surf_2
        } else {
            _diff_surf = surf_2
            _draw_surf = surf_1
        }
        
        swap = !swap
        
        var
        dx = -(surf_size.x * (1 + diffuse) - surf_size.x) / 2,
        dy = -(surf_size.y * (1 + diffuse) - surf_size.y) / 2
        
        surface_set_target(_draw_surf)
        
        shader_set(shChernobylMenuFade)
        draw_surface_ext(_diff_surf, dx, dy, 1 + diffuse, 1 + diffuse, 0, c_white, 1)
        shader_reset()
        
        if swap {
            var
            rx = irandom_range(-128, 128) * (1 - time / length[phase]),
            ry = irandom_range(-128, 128) * (1 - time / length[phase])
            draw_sprite(spr_grab, 0, rx, ry)
        }
        
        surface_reset_target()
        surface_set_target(_diff_surf)
        draw_clear_alpha(c_black, 0.0)
        surface_reset_target()
        draw_surface(_draw_surf, 0, 0)
        break
    
    case 2:
    case 3:
    case 4:
        if !surface_exists(surf_tex) {
            surf_tex = surface_create(surf_size.x, surf_size.y)
            surface_set_target(surf_tex)
            draw_clear_alpha(c_black, 0)
            with oChernobylMenuText draw()
            gpu_set_blendmode(bm_subtract)
            draw_sprite_ext(spr_blend, 0, 0, 0, 2, 2, 0, c_white, 0.2)
            gpu_set_blendmode(bm_normal)
            surface_reset_target()
        }
    
        var _t = phase == 4 ? (time + 60) * 100 : time
    
        shader_set(sh)
        shader_set_uniform_f(shader_get_uniform(sh, "time"), _t)
        shader_set_uniform_f(shader_get_uniform(sh, "seed"), seed)
    
        draw_sprite_ext(spr_bg, 0, 0, 0, 1, 1, 0, c_white, 0.9)
        
        draw_surface(surf_tex, 0, 0)
        
        shader_reset()
        break
}