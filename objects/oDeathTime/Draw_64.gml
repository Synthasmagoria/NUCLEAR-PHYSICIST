draw_set_font(fHeatwerkSmall)
draw_text_transformed(x, y, "Deaths: "+ string(savedata_get_active("death")), 2, 2, 0)
draw_text_transformed(x, y + 50, "Time: "+ time_to_string(savedata_get_active("time")), 2, 2, 0)