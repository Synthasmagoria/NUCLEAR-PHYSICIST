
view = camera_get_view(view_camera[0])

if !surface_exists(surf) {
    surf = surface_create(view[2], view[3])
}

surface_set_target(surf)
draw_clear_alpha(c_black, darkness)

gpu_set_blendmode(bm_subtract)
with (oFlashlight)
    draw_sprite_ext(sprite_index, image_index, x - other.view[0], y - other.view[1], image_xscale, image_yscale, image_angle, image_blend, image_alpha)
with (oUranium) {
    gpu_set_blendmode(bm_add)
    draw_sprite_ext(
        sUraniumCrystalGlow,
        image_index,
        x + sprite_width / 2 - other.view[0],
        y + sprite_height / 2 - other.view[1],
        other.uranium_radius_scale,
        other.uranium_radius_scale,
        0,
        color,
        other.uranium_strength)
}
gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(surf, view[0], view[1])