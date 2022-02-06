
offset = new vec2(0,0)
margin = new vec2(0,0)
content_size = new vec2(0,0)
size = new vec2(0,0)
content_position = new vec2(0,0)

update = function() {
    calculate_content_size()
    size.set(
        margin.x * 2 + content_size.x,
        margin.y * 2 + content_size.y)
    set_width(size.x)
    set_height(size.y)
}

calculate_content_size = function() {
    
}