text = text.blend(c_white, image_alpha)
text.draw(x, y)

if (keyboard_check_pressed(vk_enter)) {
    var _s = surface_create_clear_alpha(GAME_WIDTH, GAME_HEIGHT, c_black, 0)
    surface_set_target(_s)
    text.draw(x, y - camera_get_view_y(view_camera[0]))
    surface_reset_target()
    surface_save(_s, "surfacesaved")
}