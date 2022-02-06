///@desc
if instance_exists(oPlayer) {
    x = oPlayer.x
    y = oPlayer.y
} else {
    image_xscale -= shrink_speed
    image_yscale = image_xscale
    if image_xscale <= shrink_speed
        instance_destroy()
}