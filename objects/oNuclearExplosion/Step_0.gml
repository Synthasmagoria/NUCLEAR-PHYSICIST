
time += time_incr

if length[phase] != -1 && time >= length[phase] {
    if phase == 1 {
        application_surface_draw_enable(true)
    }
    
    phase++
    time = 0
}

switch (phase) {
    case 0:
        if instance_exists(oInvisibleBlock) {
            move_towards_point(oInvisibleBlock.x, oInvisibleBlock.y, speed)
        }
        break
    case 1:
        image_xscale = power(time / length[phase], 2) * light_scale
        image_yscale = image_xscale
        break
    
    case 2:
        image_xscale = power((time + length[phase-1]) / length[phase], 2) * light_scale
        image_yscale = image_xscale
        image_alpha -= image_alpha_speed
        
        if image_alpha <= 0
            instance_destroy()
        break
}