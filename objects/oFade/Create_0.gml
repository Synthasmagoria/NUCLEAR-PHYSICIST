///@desc Fade

out = false
length = 0
destroy = false

image_blend = c_black

fade = function(sec, in, destr) {
    image_alpha = in ? 1 : 0
    length = sec2f(sec)
    alarm[0] = length
    out = !in
    destroy = destr
}