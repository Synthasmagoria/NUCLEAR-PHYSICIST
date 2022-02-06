brought |= place_meeting(x, y, oPlayer);

if brought && !covering && instance_exists(oPlayer)
{
    x = oPlayer.x + brought_offset.x;
    y = oPlayer.y + brought_offset.y;
}

if brought && !covering && place_meeting(x, y, oDemonCore)
{
    x = oDemonCore.x + covering_offset.x;
    y = oDemonCore.y + covering_offset.y;
    covering = true;
    sfx_play_sound(sndDemonCoreSlam);
    sfx_play_sound(sndDemonCorePaulstretch);
    oDemonCore.become_supercritical();
    player_set_frozen(true);
}