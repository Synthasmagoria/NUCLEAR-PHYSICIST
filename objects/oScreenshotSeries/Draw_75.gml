if keyboard_check_pressed(ord("8"))
{
	repetitions = 50
	surf = -1;
	break_count = 0;
	break_length = 4;
}

if (variable_instance_exists(id, "repetitions") && repetitions)
{
	if break_count == 0
	{
		screen_save_part(string(repetitions) + ".png", 0, 0, GAME_WIDTH / 2, GAME_HEIGHT / 2)
		repetitions--;
		break_count = break_length;
	}
	
	break_count--;
}