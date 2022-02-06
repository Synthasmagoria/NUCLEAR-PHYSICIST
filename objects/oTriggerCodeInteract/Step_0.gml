touching = place_meeting(x, y, oPlayer)

if touching && !interacting && input_check_pressed("up") {
    interacting = true
    on_interact()
    player_set_frozen(freeze)
} else if interacting && allow_uninteract && input_check_pressed("shoot") {
    interacting = false
    on_uninteract()
    if freeze player_set_frozen(false)
} 