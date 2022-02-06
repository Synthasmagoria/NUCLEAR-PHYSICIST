///@desc Spawn nuclear glow

var rw05 = room_width / 2, rh05 = room_height / 2
instance_create_layer(rw05, rh05, layer, oChernobylMenuNuclear)
instance_create_layer(rw05, rh05, layer, oChernobylMenuGlow)
instance_create_layer(rw05, rh05, layer, oChernobylMenuText)
sfx_play_sound(sndChernobylMenuIntro)
gpu_set_texrepeat(true)

surf_1 = -1
surf_2 = -1
surf_tex = -1
surf_size = new vec2(room_width, room_height)
randomize()
seed = random_get_seed()

spr_grab = -1
spr_bg = -1
spr_blend = sChernobylBG05

time = 0
time_incr = f2sec(1)

sh = shNuclearPhysicistMenu
length = [3, 1, 0.5, 60, 4, -1]
phase = 0
grab = false
swap = false
diffuse = 0.02 * global.fps_adjust
music = musChernobylMenu
music_id = -1

phase_advance = function() {
    phase++
    time = 0
}
