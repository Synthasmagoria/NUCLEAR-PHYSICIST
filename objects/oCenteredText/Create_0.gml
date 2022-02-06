
text = noone
text_speed = global.fps_adjust / 2
font = fElephant24
halign = fa_center
valign = fa_middle
character = 0
character_number = 0
ease = EaseInCubic

active = false
fade_length = 0.5
fade_speed = fps_adjust(0.02)
fade_offset = new vec2(0, -24)

image_alpha = 0;

set_state = function(_active) {
    // character_number = string_length(text)
    
    if !active && _active {
        TweenEasyMove(x, y, xstart + fade_offset.x, ystart + fade_offset.y, 0, fade_length, ease)
        TweenEasyFade(0, 1, 0, fade_length, ease)
        text = text.typewriter_in(text_speed, true)
    } if active && !_active {
        TweenEasyMove(x, y, xstart, ystart, 0, fade_length, ease)
        TweenEasyFade(image_alpha, 0, 0, fade_length, ease)
        text = text.typewriter_in(0, true)
    }
    
    active = _active
}