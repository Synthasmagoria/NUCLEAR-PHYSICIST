
visible = !savedata_get_active("nuked")

if active {
    image_alpha = min(image_alpha + image_alpha_speed, 1.0)
    
    if uranium_collected && core_collected && input_check_pressed("up") && !savedata_get_active("nuked") {
        savedata_set_active("nuked", true)
        with oPlayer instance_create_depth(x, y, depth+1, oChernobylCrafting)
    }
} else {
    image_alpha = max(image_alpha - image_alpha_speed, 0.0)
}