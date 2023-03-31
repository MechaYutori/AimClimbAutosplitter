state("Aim Climb")
{
	uint room : "Aim Climb.exe", 0xA23384;
	double music : "Aim Climb.exe", 0x00813390, 0x48, 0x10, 0x220, 0xF0;
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
	//room 34 is difficulty select, music 28 is no music 
	if(current.music == 2022317 && current.room == 34)
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
				//room 4 is 2-1
				if(current.room == 4)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 1:
				//room 11 is 3-1
				if(current.room == 11)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 2:
				//room 18 is 4-1
				if(current.room == 18)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 3:
				//room 22 is 5-1
				if(current.room == 22)
				{
					vars.split += 1;
					return true;
				}
				break;
			case 4:
				//room 26 is 6-1
				if(current.room == 26)
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
		Title: 31
		Load: 32
		Map Select: 33
		Difficulty select: 34
		nyatero: 40
		click a gun: 39
		1-1: 1
		1-2: 2
		1-3: 3
		2-1: 4
		2-2: 5
		2-3: 6
		2-4: 7
		2-5: 8
		2-6: 9
		2-7: 10
		3-1: 11
		3-2: 12
		3-3: 13
		3-4: 14
		3-5: 15
		3-6: 16
		3-7: 17
		4-1: 18
		4-2: 19
		4-3: 20
		4-4: 21
		5-1: 22
		5-2: 23
		5-3: 24
		5-4: 25
		6-1: 26
		6-2: 27
		6-3: 28
		6-4: 29
		6-5(ED): 30
		Ending: 41
		Result: 43

		Music
		Title: 11
		Area1: 20
		Area2: 15
		Area3: 21
		Area4: 36
		Area5: 0
		Area6: 3
		Ending: 6
		No music: 2022317
		*/
	}
	
	//detect ending room
	if(current.room == 41)
	{
		return true;
	}
}

reset
{
	//detect title room
	if(current.room == 31)
	{
		return true;
	}
}

