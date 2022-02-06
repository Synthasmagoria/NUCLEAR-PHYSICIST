
option_index = savedata_exists()
option_number = 3
option_separation = 64
option_object = oChernobylMenuOption
option_text = ["new", "continue", "quit"]

option = array_create(option_number)
for (var i = 0; i < option_number; i++) {
    option[i] = instance_create_layer(
        x,
        y + option_separation * i,
        layer,
        option_object)
    option[i].text = option_text[i]
}
option[option_index].selected = true