
image_speed = 0
sh = shBW
factor = 0

TweenFire(id, EaseLinear, 0, true, 0, 5, "image_speed", 1, 0)
TweenFire(id, EaseLinear, 0, true, 0, 5, "factor", 0, 1)
TweenFire(id, EaseLinear, 0, true, 5, 2, "image_alpha", 1, 0)

alarm[0] = sec2f(5)