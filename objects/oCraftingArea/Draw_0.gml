///@desc

if touching {
	
	var
	sx = sprite_get_width(shell_sprite) * scale,
	sy = sprite_get_height(shell_sprite) * scale,
	dx = oPlayer.x - 24, dy = oPlayer.y - 48,
	dx2 = dx + 24 + sx,
	dy2 = dy + sy
	
	draw_set_color(c_gray)
	draw_set_alpha(0.5)
	draw_rectangle(dx - margin, dy - margin, dx2 + margin, dy2 + margin, false)
	draw_set_color(c_white)
	draw_set_alpha(1.0)
	draw_rectangle(dx - margin, dy - margin, dx2 + margin, dy2 + margin, true)
	
	draw_sprite_ext(
		crystal_sprite, 0, dx, dy, 1, 1, 0, crystal ? c_white : c_black, 1.0)
	draw_sprite_ext(
		shell_sprite, 0, dx + 24, dy, 1, 1, 0, shell ? c_white : c_black, 1.0)
	
	if crystal && shell && input_check_pressed("up") {
		instance_create_layer(0, 0, layer, oNuclearExplosion)
		player_set_frozen(true)
	}
}