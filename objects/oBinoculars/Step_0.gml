


collision = place_meeting(x, y, oPlayer)

if collision && !collision_previous { // overlap begin
    look_at(position_look)
    forth = true
} else if !collision && collision_previous { // overlap end
    look_at(position_start)
    forth = false
}

collision_previous = collision

if active {
    camera_set_view_pos(view_camera[0], position.x, position.y)
}

var _timer_next = timer + f2sec(1)

if _timer_next >= duration && timer < duration {
    active = false
    if !forth
        with (oCameraParent) {activate();}
}

timer = _timer_next

