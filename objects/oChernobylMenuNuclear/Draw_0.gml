///@desc Draw nuclear symbol

/*
	woah holy shit so many magic numbers
*/

if (!surface_exists(surf))
	surf = surface_create_clear_alpha(room_width, room_height, c_black, 0)

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
surface_set_target(surf);
draw_set_color(c_yellow);

if (time < length) {
	
	var _t
	
	for (var ii = 0; ii < density; ii++) {
		
		time += time_incr / density
		_t = power(time / length, 2) * time_val;
		// time = min(time + time_incr / density, time_max);
		
		for (var i = 0; i < 10; i++) {
			draw_text_transformed(
				x + lengthdir_x(sin(_t + i) * (sin(_t + (10 - i)) * 192), _t + i * (360/10)),
				y + lengthdir_y(sin(_t + i) * (sin(_t + (10 - i)) * 192), _t + i * (360/10)),
				"T",
				1,
				1,
				_t + i * (360/10));
		}
	}
	
	draw_set_defaults();
}

surface_reset_target();

draw()
