///@desc

touching = false
crystal = int_read_bit(savedata_get("item"), 0)
shell = int_read_bit(savedata_get("item"), 1)
margin = 4

crystal_sprite = sUraniumBlue
shell_sprite = sNuclearCore
scale = 2