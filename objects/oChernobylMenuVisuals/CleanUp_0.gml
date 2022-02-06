
if sprite_exists(spr_grab)
    sprite_delete(spr_grab)

if sprite_exists(spr_bg)
    sprite_delete(spr_bg)

if surface_exists(surf_1)
    surface_free(surf_1)

if surface_exists(surf_2)
    surface_free(surf_2)

if audio_is_playing(music_id)
    audio_stop_sound(music_id)