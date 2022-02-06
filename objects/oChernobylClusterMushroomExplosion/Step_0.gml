///@desc
inst = instance_create_layer(x, y, layer, oChernobylClusterMushroomSpore)
inst.direction = irandom(359)
inst.speed = random_range(velocity_min, velocity_max)
inst.image_xscale = random_range(size_min, size_max)
inst.image_yscale = inst.image_xscale 