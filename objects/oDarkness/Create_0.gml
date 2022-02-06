///@desc

instance_create_layer(0, 0, layer, oFlashlight).visible = false
surf = -1
darkness = 0.2

uranium_radius_scale = 4
uranium_strength = 0.2

random_set_seed(savedata_get("seed") + room)
with oUranium image_index = irandom(image_number - 1)
randomize()