draw_sprite_ext(
    sprite_index,
    image_index,
    x - camera_get_view_x(view_camera[0]),
    y - camera_get_view_y(view_camera[0]),
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha);