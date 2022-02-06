

if !variable_instance_exists(id, "target") {
    target = noone
}

if !variable_instance_exists(id, "max_hp") {
    max_hp = 100
}

hp = 0
size = new vec2(439, 18)
background_sprite = sNuclearGradeThermometerBG
animation_tween = noone