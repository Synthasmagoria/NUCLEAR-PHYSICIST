///@desc Explode

for (var xx = 0; xx < image_xscale * 3; xx++)
	for (var yy = 0; yy < image_yscale * 3; yy++)
		instance_create_layer(x + 16 + 32 * xx, y + 16 + 32 * yy, layer, oChernobylClusterMushroomExplosion)
sfx_play_sound(sndChernobylMushroomExplosion)
instance_destroy()