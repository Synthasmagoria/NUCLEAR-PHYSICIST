///@desc Draw text

if (!surface_exists(surf)) {
	surf = surface_create(room_width / surf_scale, room_height / surf_scale);
	surface_set_target(surf);
	draw_clear_alpha(c_white, 0.0);
	surface_reset_target();
}

time += time_incr;
radius += time_incr * 24;

var _t = power(time / length, 2) * length
alpha = min(time, 1)

var
dir = 360/text_number,
xx, yy, wav, scl;

surface_set_target(surf);

draw_set_color(c_black);
draw_set_alpha(0.07);
draw_rectangle(0, 0,
	surface_get_width(surf),
	surface_get_height(surf),
	false);
draw_set_alpha(1.0);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_set_font(font)

for (var i = 0; i < text_number; i++) {
	wav = abs(sin(_t + i));
	xx = (x + lengthdir_x(wav * radius, i * dir)) / surf_scale;
	yy = (y + lengthdir_y(wav * radius, (text_number - i) * dir)) / surf_scale;
	scl = (0.25 + abs(xx - x) / 48) / surf_scale;
	
	draw_text_transformed(xx, yy, text, scl, scl, _t);
}
surface_reset_target();

draw_set_defaults()

draw()