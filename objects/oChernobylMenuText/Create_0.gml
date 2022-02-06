
text = "Nuclear\nPhysicist"
font = fPropaganda
time = 0
time_incr = f2sec(1)
length = 3
offset = new vec2(4, 4)
auto = true

draw = function() {
    var _progress = power(time / length, 2) * string_length(text)
    draw_set_font(font)
    draw_set_color(c_red)
    draw_text_shadow(offset.x, offset.y, string_copy(text, 0, _progress), make_color_hsv(120, 128, 255), 4)
    draw_set_defaults()
}