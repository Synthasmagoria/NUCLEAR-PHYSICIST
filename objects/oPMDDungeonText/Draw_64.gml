
if !surface_exists(surf) {
    surf = surface_create(GAME_WIDTH, GAME_HEIGHT)
    surface_set_target(surf)
    draw_set_color(c_black)
    draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false)
    draw_set_color(c_white)
    draw_set_font(font)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    var gw = GAME_WIDTH / 2, gh = GAME_HEIGHT / 2
    draw_text(gw, gh, string_replace(text_floor, text_floor_replace, string(text_floor_index)))
    draw_text(gw, gh + text_name_yoffset, text_name)
    draw_set_defaults()
    surface_reset_target()
}

draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, image_alpha)