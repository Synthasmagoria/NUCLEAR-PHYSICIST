var _touching = place_meeting(x, y, oPlayer)

if _touching && !touching && !instance_exists(prompt_type) {
	player_set_frozen(true)
	oPlayer.velocity.y = oPlayer.yvelocity_max;
	prompt_create(prompt_text, prompt_type)
	sfx_play_sound(sndPromptPopup)
}

touching = _touching;