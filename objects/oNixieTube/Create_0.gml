

clock = noone
offset = new vec2(xstart,ystart)
queued = noone
queued_delay = 0.5
blink = 0.5

fade_speed = fps_adjust(0.05)
fade = 0

image_speed = 0
image_index = image_number - 1
image_index_previous = 0

set_digit = function(dig) {
    if dig < 9 {
        if dig > 0 {
            transition_to_digit(0)
            queue_digit(dig, transition_get_length() + sec2f(queued_delay))
        } else {
            transition_to_digit(dig)
        }
    }
}

queue_digit = function(dig, dlay) {
    queued = dig
    alarm[0] = dlay
}

transition_to_digit = function(dig) {
    fade = 1
    image_index_previous = image_index
    image_index = dig
}

transition_get_length = function() {
    return 1 / fade_speed
}