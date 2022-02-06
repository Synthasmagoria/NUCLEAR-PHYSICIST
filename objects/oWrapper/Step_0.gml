instance_place_list(x, y, all, list, false)

for (var i = ds_list_size(list) - 1; i >= 0; i--) {
    with (list[|i]) {
        if x > room_width
            x -= room_width
        else if x < 0
            x += room_width
        
        if y > room_height
            y -= room_height
        else if y < 0
            y += room_height
    }
}

ds_list_clear(list)