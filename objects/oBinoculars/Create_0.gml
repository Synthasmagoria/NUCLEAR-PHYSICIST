


// Only works with one active camera

duration = 1
timer = 0

collision = false
collision_previous = false
active = false
forth = false

tween_x = noone
tween_y = noone

position_start = new vec2(0, 608)
position_look = new vec2(800, 0)
position = new vec2(position_start.x, position_start.y)

look_at = function(pos) {
    with (oCameraParent) {active = false}
    stop_tweening()
    tween_to(pos)
    active = true
    timer = 0
}

stop_tweening = function() {
    if is_tweening() {
        TweenDestroy(tween_x)
        TweenDestroy(tween_y)
    }
}

tween_to = function(goal) {
    tween_x = TweenFire(self, EaseOutExpo, 0, true, 0, duration, "position.x", position.x, goal.x)
    tween_y = TweenFire(self, EaseOutExpo, 0, true, 0, duration, "position.y", position.y, goal.y)
}

is_tweening = function() {
    return TweenIsActive(tween_x)
}