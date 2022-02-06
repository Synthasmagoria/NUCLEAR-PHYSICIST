

var
_c = camera_get_view(view_camera[0]),
_x = x - _c[0],
_y = y - _c[1]

draw_sprite_ext(background_sprite, 0, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
draw_set_color(c_red)
var _size = new vec2(size.x * image_xscale, size.y * image_yscale)
draw_rectangle(_x, _y, _x + _size.x * (hp / max_hp), _y + _size.y, false)
draw_set_color(c_white)
draw_self()
