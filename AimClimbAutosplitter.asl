state("Aim Climb")
{
	uint room : "Aim Climb.exe", 0x9B3E38;
	uint music : "Aim Climb.exe", 0x009B86D8, 0x30, 0x3D0, 0x80;
}


startup
{
	settings.Add("Category", true, "Check it and pick the category you are running.");
	settings.Add("1map", true, "Map 1 or 2", "Category");
	settings.Add("2maps", false, "2 maps", "Category");
	settings.Add("Split", true, "Split on every stages.");
	refreshRate = 60;
	vars.split = 0; 
	vars.map_c = 0;
}

start
{
	vars.split = 0;
	vars.map_c = 0;
	//room 34 is difficulty select, music 0 is no music 
	if(current.music == 0 && current.room == 34)
	{
		if(settings["1map"]){
			vars.map_c = 1;
			return true;
		}
		else if(settings["2maps"]){
			vars.map_c = 3;
			return true;
		}
	}
	else if(current.music == 0 && current.room == 100 && settings["1map"])
	{
		vars.map_c = 2;
		return true;
	}

}



split
{
	//switch with vars.split somehow doesn't work
	int split = vars.split;
	int category = vars.map_c;

	if(category == 1)
	{
		if(settings["Split"])
		{
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
		}
		//detect ending room
		if(current.room == 41)
		{
			return true;
		}
	}
	else if(category == 2)
	{
		if(settings["Split"])
		{
			switch (split)
			{
				case 0:
					//room 59 is 2-1
					if(current.room == 59)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 1:
					//room 67 is 3-1
					if(current.room == 67)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 2:
					//room 85 is 4-1
					if(current.room == 85)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 3:
					//room 77 is 5-1
					if(current.room == 77)
					{
						vars.split += 1;
						return true;
					}
					break;
				default:
					break;
			}
		}
		//detect ending room
		if(current.room == 98)
		{
		return true;
		}
	}
	else if(category == 3)
	{
		if(settings["Split"])
		{
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
				case 5:
					//room 41 is select time
					if(current.room == 41)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 6:
					//room 100 is difficulty select, music 0 is no music 
					if(current.music == 0 && current.room == 100)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 7:
					//room 59 is 2-1
					if(current.room == 59)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 8:
					//room 67 is 3-1
					if(current.room == 67)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 9:
					//room 85 is 4-1
					if(current.room == 85)
					{
						vars.split += 1;
						return true;
					}
					break;
				case 10:
					//room 77 is 5-1
					if(current.room == 77)
					{
						vars.split += 1;
						return true;
					}
					break;
				default:
					break;
			}
		}
		//detect ending room
		if(current.room == 98)
		{
			return true;
		}
	}

	/*
	Some information may be outdated
                
	-Rooms and musics list-
	Room
	Title: 31
	Load: 32
	Map Select: 33
	M1 Difficulty select: 34
	M1 nyatero: 40
	M2 Difficulty select: 100
	M2 nyatero: 101

	click a gun: 39

	M1
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

	M2
	1-1: 51
	1-2: 52
	1-3: 53
	1-4: 54
	1-5: 55
	1-6: 56
	1-7: 57
	1-8: 58
	2-1: 59
	2-2: 60
	2-3: 61
	2-4: 62
	2-5: 63
	2-6: 64
	2-7: 65
	2-8: 66
	3-1: 67
	3-2: 68
	3-3: 69
	3-4: 70
	3-5: 71
	3-6: 72
	3-7: 73
	3-8: 74
	3-9: 75
	3-10: 76
	change: 50
	4-1: 85
	4-2: 86
	4-3: 87
	4-4: 88
	4-5: 89
	4-6: 90
	4-7: 91
	4-8: 92
	5-1: 77
	5-2: 78
	5-3: 79
	5-4: 80
	5-5: 81
	5-6: 102
	5-7: 82
	5-8: 83
	5-9(ED): 84
	Ending: 41
	Result: 95 


	Music
	Title: 14
	Area1-1: 3
	Area1-2: 4
	Area1-3: 5
	Area1-4: 6
	Area1-5: 7
	Area1-6: 8
	
	Area2-1: 9
	Area2-2: 10
	Area2-3: 11
	Area2-4: 12
	Area2-5: 13
	Ending: 2
	No music: 0
	*/
}

reset
{
	//detect title room
	if(current.room == 31 && !settings["2maps"])
	{
		vars.map_c = 0;
		return true;
	}
	if (old.room != 34 && current.room == 34 && settings["2maps"])
	{
		vars.map_c = 0;
		return true;
	}
}
