

image_xscale = scale
image_yscale = scale
image_angle += rotation_speed

life -= f2sec(1)

if life <= 0 {
    instance_destroy()
}