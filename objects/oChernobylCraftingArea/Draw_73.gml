
draw_self()

var dx = x + margin.x, dy = y + margin.y
draw_sprite_ext(uranium_sprite, 0, dx, dy, scale, scale, 0, uranium_collected ? c_white : c_black, image_alpha)
draw_sprite_ext(core_sprite, 0, dx + item_width, dy, scale, scale, 0, core_collected ? c_white : c_black, image_alpha)