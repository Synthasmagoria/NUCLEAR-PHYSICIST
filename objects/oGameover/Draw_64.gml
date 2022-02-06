

shader_set(shader);
shader_set_uniform_f(shader_get_uniform(shader, "time"), time);
shader_set_uniform_f(shader_get_uniform(shader, "area_position"), position.x, position.y);
shader_set_uniform_f(shader_get_uniform(shader, "area_size"), size.x, size.y);
shader_set_uniform_f(shader_get_uniform(shader, "uv_top"), uvs[0], uvs[1]);
shader_set_uniform_f(shader_get_uniform(shader, "uv_bottom"), uvs[2], uvs[3]);
shader_set_uniform_f(shader_get_uniform(shader, "pixel"), pixel.x * outline, pixel.y * outline);
draw_self();
shader_reset();