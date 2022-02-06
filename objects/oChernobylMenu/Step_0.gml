
if input_check_pressed("down") {
    option[option_index].selected = false
    option_index++
    if option_index >= option_number
        option_index = 0
    option[option_index].selected = true
} else if input_check_pressed("up") {
    option[option_index].selected = false
    option_index--
    if option_index < 0
        option_index = option_number - 1
    option[option_index].selected = true
}

if input_check_pressed("jump") {
    switch (option_index) {
        case 0:
            savedata_new_game()
            break
        case 1:
            if savedata_exists() {
                savedata_read()
                savedata_load()
                savedata_start_game(true)
            } else {
                sfx_play_sound(sndPromptBack)
            }
            break
        case 2:
            game_end()
            break
    }
}