instance_place_list(x, y, all, list, false)

for (var i = ds_list_size(list) - 1; i >= 0; i--) {
    list[|i].x += offset.x
    list[|i].y += offset.y
}

ds_list_clear(list)