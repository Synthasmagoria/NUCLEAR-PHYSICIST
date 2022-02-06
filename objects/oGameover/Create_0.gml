

x = 0;
y = 0;

position = new vec2(60 / sprite_width, (251) / sprite_height);
size = new vec2(680 / sprite_width, (106) / sprite_height);
time = 0;
shader = shGameover;
uvs = sprite_get_uvs(sprite_index, image_index);
pixel = new vec2(texture_get_texel_width(sprite_get_texture(sprite_index, 0)), texture_get_texel_height(sprite_get_texture(sprite_index, 0)));
outline = 4;
image_blend = c_lime;
alarm[0] = sec2f(1);
running = false;