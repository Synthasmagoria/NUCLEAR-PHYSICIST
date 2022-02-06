
if instance_exists(oPlayer) {
	player_set_stopped(false)
	oPlayer.animate = true
	var explosion = instance_create_depth(0, 0, depth-1000, oNuclearExplosion)
	explosion.x = x - explosion.sprite_width / 2
	explosion.y = y - explosion.sprite_height / 2
}