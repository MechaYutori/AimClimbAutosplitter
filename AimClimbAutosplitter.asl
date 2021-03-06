state("Aim Climb")
{
	uint room : "Aim Climb.exe", 0x875818;
	double music : "Aim Climb.exe", 0x8751F0, 0x568, 0xF0, 0x160;
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
	if(current.music == 28 && current.room == 16)
	{
		return true;
	}
}



split
{
	if(settings["Split"])
	{
		int split = vars.split;
		switch (split)
		{
			case 0:
				//room 46 is 2-1
				if(current.room == 46)
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
				if(current.room == 34)
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
	}
	
	//detect ending room
	if(current.room == 35)
	{
		return true;
	}
}

reset
{
	//detect title room
	if(current.room == 44)
	{
		return true;
	}
}
