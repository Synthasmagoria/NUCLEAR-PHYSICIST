surf = -1;
sh = shDemonCore;
time = 0;
active = false;

show_death_time_delay = 5;
play_music_delay = 3;
music = musChernobylClear;
death_time_popup_sound = sndChernobylCrafting12;
show_iwt_time_delay = 7;
show_clear_text_delay = 9;

iwt_logo_instance = noone;
it_dont_go_deeper_instance = noone;

become_supercritical = function() {
    active = true;
    alarm[0] = sec2f(show_death_time_delay);
    alarm[1] = sec2f(play_music_delay);
    alarm[2] = sec2f(show_iwt_time_delay);
    alarm[3] = sec2f(show_clear_text_delay);
}