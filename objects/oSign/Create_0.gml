
textbox = noone
reading = false
sound = sndIdiotSavantTheme
popup_sound = sndSignPopup
phase = 0
phase_number = 3
length = 4.5
time = 0
touching = false
text = "<DEFAULT TEXT>"

advance_phase = function() {
    phase = (phase + 1) % phase_number
    time = 0
}