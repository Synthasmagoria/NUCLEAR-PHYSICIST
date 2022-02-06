
time += f2sec(1)
touching = place_meeting(x, y, oPlayer)

switch phase {
    case 0:
        if touching && !reading && input_check_pressed("up") {
            reading = true
            player_set_frozen(true)
            sfx_play_sound(sound)
            advance_phase()
        }
        break
    
    case 1:
        if time > length {
            sfx_play_sound(popup_sound)
            textbox = textbox_create_string(text)
            advance_phase()
        }
        break
    
    case 2:
        if reading && input_check_pressed("jump") {
            reading = false
            player_set_frozen(false)
            instance_destroy(textbox)
            advance_phase()
        }
        break
}