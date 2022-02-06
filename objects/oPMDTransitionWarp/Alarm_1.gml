text_inst = instance_create_layer(0, 0, layer, oPMDDungeonText)
text_inst.text_floor_index = text_inst.room_get_floor_index(warp_room)
alarm[1] = -1