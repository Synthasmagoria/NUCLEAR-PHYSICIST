
event_inherited()

core_collected = false
uranium_collected = false

core_sprite = sNuclearCore
uranium_sprite = sUraniumBlue

scale = 2
target_yoffset = -48
dim = 0.75
item_width = 0
margin.set(12, 6)
active = false

image_alpha = 0
image_alpha_speed = f2sec(1)

calculate_content_size = function() {
    item_width = sprite_get_width(core_sprite) * scale
    content_size.set(
        item_width * 2,
        sprite_get_height(core_sprite) * scale);
}