enum SUBGAME {
    NUCLEAR,
    PENIS2,
    DESCENT,
    SEEKER,
    RETARD,
    DEVHELL,
    LION,
    RODEO,
    __MAX
}

///@desc Checks if the world is resetting the room
///@func game_is_resetting_room()
function game_is_resetting_room() {
	return oGame.resetting_room != ""
}

///@desc Gets the room that is being restarted to
///@func game_get_resetting_room()
function game_get_resetting_room() {
	return oGame.resetting_room
}

///@func world_restart_game()
function subgame_restart() {
	///@desc Save death, time & free memory
	if (global.game_running) {
		savedata_save("time")
		savedata_save("death")
		savedata_write()
	}
	
	instance_destroy(oPlayer)
	
	global.game_running = false
	global.game_playing = false
	global.game_paused = false
	
	// Free memory
	if (surface_exists(oGame.pause_surface))
		surface_free(oGame.pause_surface)
	
	room_goto(global.menu_room)
}

function subgame_change(index) {
    switch (index) {
        case SUBGAME.NUCLEAR:
            global.savedata.save_prefix = "np"
            global.menu_room = rChernobylMenu
            break
        
        case SUBGAME.PENIS2:
            global.savedata.save_prefix = "p2"
            global.menu_room = rP2Menu
            break
        
        default:
            global.savedata.save_prefix = ""
            global.menu_room = rMenu
            break
    }
}