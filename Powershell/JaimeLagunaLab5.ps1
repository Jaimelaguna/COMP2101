Param ($Option)
switch ($Option)
	{
	""		{System_Info1
			Operating_System1
			Processor1
			Memory1
			Drives1
			Network1
			Video_Cards1}
	"System"	{Processor1
			Operating_System1
			Processor1
			Memory1
			Video_Cards1}
	"Disks"		{Drives1}
	"Network"	{Network1}
	Default {"Invalid Parameter, please try again"}
}