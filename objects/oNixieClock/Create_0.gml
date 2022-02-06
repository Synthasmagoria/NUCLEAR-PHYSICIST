
bulb = []
bulb_scale = 0.6

create = function(bulb_num, w = 192) {
    for (var i = 0; i < array_length(bulb); i++) {
        instance_destroy(bulb[i])
    }
    
    bulb = -1
    
    var
    _sep = w / (bulb_num + 1),
    _x = (-w / 2) + _sep
    
    for (var i = 0; i < bulb_num; i++) {
        bulb[i] = instance_create_depth(_x + _sep * i, 0, depth, oNixieTube)
        bulb[i].clock = id
        bulb[i].image_xscale = bulb_scale
        bulb[i].image_yscale = bulb_scale
    }
}

set = function(ind, val) {
    bulb[ind].set_digit(val)
}

set_all = function(arr) {
    for (var i = 0; i < array_length(arr) || i < array_length(bulb); i++) {
        bulb[i].set_digit(arr[i])
    }
}