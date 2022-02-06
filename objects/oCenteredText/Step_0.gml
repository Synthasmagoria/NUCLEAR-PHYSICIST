
if image_alpha == 0 {
    text = text.typewriter_reset()
}

character = min(character + text_speed * active, character_number)