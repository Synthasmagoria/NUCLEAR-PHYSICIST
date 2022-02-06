///@desc

// Inherit the parent event
event_inherited();

wobble_total = wobble

with oPlayer {
    var _l = ds_list_create()
    if collision_circle_list(x, y, other.uranium_radius, oUranium, false, false, _l, true) {
        other.wobble_factor = 1 - point_distance(x, y, _l[|0].x, _l[|0].y) / other.uranium_radius
        other.wobble_total += other.wobble_factor * other.wobble_add
    } else {
        other.wobble_factor = 0
    }
    audio_sound_gain(other.sound, other.wobble_factor, 0)
    ds_list_destroy(_l)
}