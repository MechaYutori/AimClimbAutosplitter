state("Aim Climb")
{
	uint room : "Aim Climb.exe", 0x88E0C8;
	double music : "Aim Climb.exe", 0x005CF9E0, 0x568, 0x90, 0x180;
}


startup
{
	settings.Add("Split", true, "Split on every stages.");
	refreshRate = 60;
	vars.split = 0; 
}

start
{
	vars.split = 0; 
	//room 16 is difficulty select, music 28 is no music 
	if(current.music == 2022317 && current.room == 16)
	{
		return true;
	}
}



split
{
	if(settings["Split"])
	{
		//switch with vars.split somehow doesn't work
		int split = vars.split;
		switch (split)
		{
			case 0:
				//room 46 is 2-1
				if(current.room == 48)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 1:
				//room 2 is 3-1
				if(current.room == 2)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 2:
				//room 0 is 4-1
				if(current.room == 0)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 3:
				//room 34 is 5-1
				if(current.room == 36)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 4:
				//room 5 is 6-1
				if(current.room == 5)
				{
					vars.split += 1;
					return true;
				}
				break;
			default:
				break;
		}
		/*
		-Rooms and musics list-
		Room
		Title: 46
		Load: 1
		Map Select: 17
		Difficulty select: 16
		nyatero: 31
		click a gun: 4
		1-1: 49
		1-2: 7
		1-3: 38
		2-1: 48
		2-2: 28
		2-3: 34
		2-4: 14
		2-5: 42
		2-6: 40
		2-7: 6
		3-1: 2
		3-2: 3
		3-3: 8
		3-4: 26
		3-5: 41
		3-6: 9
		3-7: 21
		4-1: 0
		4-2: 35
		4-3: 27
		4-4: 12
		5-1: 36
		5-2: 45
		5-3: 44
		5-4: 33
		6-1: 5
		6-2: 19
		6-3: 39
		6-4: 22
		6-5(ED): 13
		Ending: 37
		Result: 43

		Music
		Title: 10
		Area1: 19
		Area2: 14
		Area3: 20
		Area4: 35
		Area5: 0
		Area6: 3
		Ending: 5
		No music: 2022317
		*/
	}
	
	//detect ending room
	if(current.room == 37)
	{
		return true;
	}
}

reset
{
	//detect title room
	if(current.room == 46)
	{
		return true;
	}
}

