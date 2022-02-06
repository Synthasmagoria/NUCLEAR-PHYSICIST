

fade = max(fade - fade_speed, 0)

with clock {
    other.x = x + other.offset.x
    other.y = y + other.offset.y
}