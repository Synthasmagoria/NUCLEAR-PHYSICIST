

draw_self()
var _blink = fade != 0
draw_sprite_ext(
    sprite_index,
    image_index_previous,
    x,
    y,
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    fade + random_range(-blink * _blink, blink * _blink))