if !surface_exists(surf)
{
    surf = surface_create(GAME_WIDTH, GAME_HEIGHT)
}

surface_copy(surf, 0, 0, application_surface);

shader_set(sh);
shader_set_uniform_f(shader_get_uniform(sh, "time"), time);
shader_set_uniform_f(shader_get_uniform(sh, "resolution"), GAME_WIDTH, GAME_HEIGHT);
shader_set_uniform_f(shader_get_uniform(sh, "demon_core_position"), x, y);
draw_surface(surf, 0, 0);
shader_reset();