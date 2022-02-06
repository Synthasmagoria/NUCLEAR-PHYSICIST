///@desc Window/Game control

// Debug
if (DEBUG && global.game_playing) {
	// Toggle nodeath
	if (input_check_pressed("debug_nodeath")) {
		global.debug_nodeath = !global.debug_nodeath
		sfx_play_sound(sndBlockChange)
	}
	
	// Save anywhere
	if (input_check_pressed("debug_save") && instance_exists(oPlayer)) {
		savedata_save_player()
		sfx_play_sound(sndBlockChange)
	}
	
	// Place the player at mouse
	if (mouse_check_button_pressed(mb_left)) {
		if (!instance_exists(oPlayer))
			player_respawn()
		
		oPlayer.x = mouse_x
		oPlayer.y = mouse_y
	}
	
	// Go to any room
	if (input_check_pressed("debug_warp")) {
		var r = asset_get_index(get_string("Go to room: ", ""))
		if (room_exists(r))
			room_goto(r)
	}
	
	if (input_check_pressed("debug_next_room")) {
		if room != room_last {
			room_goto_next()
		}
	}
	
	if (input_check_pressed("debug_prev_room")) {
		if room != room_first {
			room_goto_previous()
		}
	}
}

// Game control
if (global.game_playing) {
	
	// Pause
	if (input_check_pressed("pause")) {
		global.game_paused = !global.game_paused
		
		if (global.game_paused) {
			instance_deactivate_all(true)
			instance_activate_object(oAudio)
			instance_activate_object(oInput)
			instance_activate_object(oSaveData)
		} else {
			instance_activate_all()
		}
		
		if (surface_exists(pause_surface)) {
			surface_free(pause_surface)
		}
	}
	
	if (!global.game_paused) {
		// Do time
		savedata_set_active("time", savedata_get_active("time") + f2sec(1) * (!savedata_get_active("clear")))
		
		// Retry
		if (input_check_pressed("retry")) {
			if (instance_exists(oPlayer) && !savedata_get_active("clear"))
				savedata_set_active("death", savedata_get_active("death") + 1);
			
			savedata_save("death", "time")
			savedata_load()
			
			resetting_room = savedata_get("room")
		}
	}
}

// Main menu
if (input_check_pressed("menu"))
	subgame_restart()

// Quit
if (input_check_pressed("quit"))
	game_end()

// Toggle smoothing mode
if (input_check_pressed("toggle_smoothing")) {
	setting_set("smoothing", !setting_get("smoothing"))
	with oMenu refresh_setting_strings()
}

// Toggle vsync
if (input_check_pressed("toggle_vsync")) {
	setting_set("vsync", !setting_get("vsync"))
	with oMenu refresh_setting_strings()
}

// Fullscreen
if (input_check_pressed("fullscreen")) {
	setting_set("fullscreen", !setting_get("fullscreen"))
	with oMenu refresh_setting_strings()
}

// Screenshot
if (input_check_pressed("screenshot"))
	screen_save(string_lettersdigits(date_datetime_string(date_current_datetime())) + ".png")