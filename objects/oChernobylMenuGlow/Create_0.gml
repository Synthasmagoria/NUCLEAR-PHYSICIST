///@desc

text = "*";
text_number = 32;
time = 0;
time_incr = f2sec(1);
length = 3;
font = fDefault;
alpha = 0;

radius = 32;

surf = -1;
surf_scale = 6;

draw = function() {
	draw_surface_ext(surf, -surf_scale / 2, -surf_scale / 2, surf_scale, surf_scale, 0, c_white, alpha);
}